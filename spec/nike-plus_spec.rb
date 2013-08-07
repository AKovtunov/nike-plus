require 'spec_helper'
token = CONFIG['TOKEN']

def behaves_like_hash object
	response = object
    expect(response).not_to be_nil
  	expect(response).to be_kind_of (Hash)
end

describe NikeplusApi::Character do
  let(:me){NikeplusApi::Character.new(token)}
  it "should create connection" do
		expect(me).to be_kind_of(NikeplusApi::Character)
  end
  it "should should raise an error without token" do
  	expect{NikeplusApi::Character.new}.to raise_error(ArgumentError)
  end
  it "should get list of activities as hash", :vcr do
  	me = NikeplusApi::Character.new(token)
    behaves_like_hash me.list_activities
  end
  it "should get aggregate sport data as hash", :vcr do
  	me = NikeplusApi::Character.new(token)
    behaves_like_hash me.aggregate_sport_data
  end
  it "should get valid activity details as hash", :vcr do
  	behaves_like_hash me.activity_details "e1a02c8a-137b-4e52-a8f8-124d5afa3f3b"
  end
  it "should raise error without id for activity details" do
  	expect{me.activity_details}.to raise_error(ArgumentError)
  end
  it "should get gps data of valid activity as hash", :vcr do
  	behaves_like_hash me.gps_data "e1a02c8a-137b-4e52-a8f8-124d5afa3f3b"
  end
  it "should raise error without id for gps data" do
  	expect{me.gps_data}.to raise_error(ArgumentError)
  end
end