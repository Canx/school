require 'spec_helper'

describe CitiesController do

  describe "GET 'show'" do
    before do
      @city = FactoryGirl.create(:city)
      get 'show', id: @city.id
    end

    it "should redirect to city levels page" do
      response.should redirect_to(city_levels_url(city_id: @city.id)) 
    end
  end
end
