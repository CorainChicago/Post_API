require 'net/http'

module API
  class CrowdTangleApi

    def self.call
      url = 'https://api.crowdtangle.com/posts?token=' + ENV['API_KEY']
      until url == nil do 
        result = get_data(url)
        import(result)
        url = result["result"]["pagination"]["nextPage"]
      end  
    end

    private
    
    def self.get_data(url)
      uri = URI(url)
      result = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        request = Net::HTTP::Get.new uri
        response = http.request request
      end
      JSON.parse(result.body)      
    end

    def self.import(result_hash)
      result_hash["result"]["posts"].each do |post|

         account = Account.find_or_create_by(crowd_tangle_id: post["account"]["id"]) do |a| 
          a.handle = post["account"]["handle"]
          a.name = post["account"]["name"]
          a.platform = post["account"]["platform"]
          a.profileImage = post["account"]["profileImage"]
          a.subscriberCount = post["account"]["subscriberCount"]
          a.url = post["account"]["url"]
          a.verified = post["account"]["verified"]
        end

        current_post = Post.find_or_create_by(crowd_tangle_id: post["id"]) do |p|
          p.account_id = account.id 
          p.caption = post["caption"] 
          p.link = post["link"] 
          p.media = post["media"] 
          p.message = post["message"] 
          p.platform = post["platform"] 
          p.postUrl = post["postUrl"] 
          p.date = post["date"] 
          p.expandedLinks = post["expandedLinks"] 
          p. score = post["score"]
        end
      end
    end
  end
end
