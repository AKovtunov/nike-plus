require "nikeplus_api/version"
require 'json'
require 'yaml'
require 'httparty'

module NikeplusApi

  class Character
    attr_reader :token

    CONFIG = YAML.load_file("lib/config/token.yml") unless defined? CONFIG
    HEADERS = {"appid"=>CONFIG["APPID"], "Accept"=>"application/json", "Content-Type"=>"application/json"}

    def initialize(token)
      if token.nil?
        raise ArgumentError, "You should input your generated token"
      else
        @token = token
      end
      @url = "https://api.nike.com/me/"
    end

    def get_data url
      response = HTTParty.get(url, :headers => HEADERS)
      return JSON.parse(response.body)
    end


    def list_activities
      url=@url+"sport/activities?access_token=#{token}"
      get_data url
    end

    def aggregate_sport_data
      url=@url+"sport?access_token=#{token}"
      get_data url
    end

    def activity_details id
	    if id.nil?
	     raise ArgumentError, "You should input id of activity"
      else
        url=@url+"sport/activities/#{id}?access_token=#{token}"
        get_data url
      end
    end

    def gps_data id
      if id.nil?
        raise ArgumentError, "You should input id of activity"
      else
        url=@url+"sport/activities/#{id}/gps?access_token=#{token}"
        get_data url
      end
    end

  end

end
