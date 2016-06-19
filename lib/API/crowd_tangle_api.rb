require 'net/http'

module API
  class CrowdTangleApi

    def self.call_api
      result = get_data('https://api.crowdtangle.com/posts?token=' + ENV['API_KEY'])
      begin
       import(result)
       result = get_data(result["result"]["pagination"]["nextPage"])
      end while result["result"]["pagination"] != nil 
    end
    
    def self.get_data(url)
      uri = URI('https://api.crowdtangle.com/posts?token=' + ENV['API_KEY'])
      result = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        request = Net::HTTP::Get.new uri
        response = http.request request
      end
      JSON.parse(result.body)      
    end

    def self.import(result_hash)
      result_hash["result"]["posts"].each do |post|

        account = Account.find_or_create_by(
          handle: post["account"]["handle"],
          crowd_tangle_id: post["account"]["id"], 
          name: post["account"]["name"],
          platform: post["account"]["platform"],
          profileImage: post["account"]["profileImage"],
          subscriberCount: post["account"]["subscriberCount"],
          url: post["account"]["url"],
          verified: post["account"]["verified"])

        current_post = Post.find_or_create_by(
          account_id: account.id, 
          crowd_tangle_id: post["id"], 
          caption: post["caption"], 
          link: post["link"], 
          media: post["media"], 
          message: post["message"], 
          platform: post["platform"], 
          postUrl: post["postUrl"], 
          date: post["date"], 
          expandedLinks: post["expandedLinks"], 
          score: post["score"]) rescue byebug

        Statistic.find_or_create_by(
          post_id: current_post.id,
          actual_likeCount: post["statistics"]["actual"]["likeCount"], 
          actual_shareCount: post["statistics"]["actual"]["shareCount"],
          actual_commentCount: post["statistics"]["actual"]["commentCount"],
          expected_likeCount: post["statistics"]["expected"]["likeCount"],
          expected_shareCount: post["statistics"]["expected"]["shareCount"],
          expected_commentCount: post["statistics"]["expected"]["commentCount"]) rescue byebug

        post["media"].each do |media| 
          MediaItem.find_or_create_by(
            post_id: current_post.id, 
            full: media["full"],
            height: media["height"],
            width: media["width"],
            type: media["url"])
        end
      end
    end
  end
end
