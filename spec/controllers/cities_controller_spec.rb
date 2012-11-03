require 'spec_helper'

describe CitiesController do

  describe "GET 'show'" do
    before do
      @city = FactoryGirl.create(:city)
      get 'show', id: @city.id
    end

    it "should show the city name" do
      pending
    end

    it "should return all levels that can be studied in city" do
      pending
    end
  end
end
