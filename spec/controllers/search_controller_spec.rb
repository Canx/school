require 'spec_helper'

describe SearchController do

  describe "GET 'show'" do

    it "returns error when no query is done" do
      get 'show', :query => ""
      flash[:error].should_not be_nil
    end

    it "returns error when no results are found" do
      FactoryGirl.create(:school)
      get 'show', :query => "Madrid"
      flash[:error].should_not be_nil
    end

    it "shows a list of posible cities when results are from diferent cities" do
      city1 = FactoryGirl.create(:city, name: "Benicarlo")
      city2 = FactoryGirl.create(:city, name: "Benicassim")
      FactoryGirl.create(:school, name: "IES 1", city: city1)
      FactoryGirl.create(:school, name: "IES 2", city: city2)
      get 'show', :query => "Beni"
      response.should render_template("search/cities")
    end
  end

end
