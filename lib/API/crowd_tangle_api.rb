require 'net/http'

module API
  class CrowdTangleApi
    def self.get_data
      uri = URI('https://api.crowdtangle.com/posts?token=' + ENV['API_KEY'])
      result = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
              request = Net::HTTP::Get.new uri

              response = http.request request # Net::HTTPResponse object
              end
       puts result.body       
    end

  end
end
