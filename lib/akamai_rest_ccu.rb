require "akamai_rest_ccu/version"
require 'httparty'
require 'json'

module AkamaiRestCcu
  class Ccu

    BASE_URL = "https://api.ccu.akamai.com/ccu/v2/queues/default"

    def initialize(username, password)
      auth = {:username => username, :password => password}
      @base_params = {:headers => { 'Content-Type' => 'application/json' }, :basic_auth => auth}
    end

    def purge_urls(urls, opt = {})
      request('post', BASE_URL, {:body => {:objects => urls}.merge(opt).to_json})
    end

    def purge_cpcodes(cpcodes, opt = {})
      request('post', BASE_URL, {:body => {:type => "cpcode", :objects => cpcodes}.merge(opt).to_json})
    end

    def purge_status(progress_uri)
      url = "#{BASE_URL}#{progress_uri}"
      request 'get', url
    end

    def queue_length
      request 'get', BASE_URL
    end

    private
    def request(method, url, params = {})
      HTTParty.send(method, url, @base_params.merge(params))
    end
  end
end
