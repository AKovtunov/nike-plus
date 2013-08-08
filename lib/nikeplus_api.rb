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
      raise ArgumentError, "You should input your generated token" if token.nil?
      @token = token
    end

    def get_data url
      base_url = "https://api.nike.com/me/"
      response = HTTParty.get(base_url+url, :headers => HEADERS)
      return JSON.parse(response.body)
    end


    def list_activities
      get_data "sport/activities?access_token=#{token}"
    end

    def aggregate_sport_data
      get_data "sport?access_token=#{token}"
    end

    def activity_details id
      raise ArgumentError, "You should input id of activity" if id.nil?
      get_data "sport/activities/#{id}?access_token=#{token}"
    end

    def gps_data id
      raise ArgumentError, "You should input id of activity" if id.nil?
      get_data "sport/activities/#{id}/gps?access_token=#{token}"
    end

  end

end
