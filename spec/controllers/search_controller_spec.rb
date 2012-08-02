require 'spec_helper'

describe SearchController do

  describe "POST 'show'" do

    it "returns error when no query is done" do
      post 'show', :query => ""
      flash[:error].should_not be_nil
    end

    it "returns error when no results are found" do
      FactoryGirl.create(:school)
      post 'show', :query => "Madrid"
      flash[:error].should_not be_nil
    end

    it "shows a list of posible cities when results are from diferent cities" do
      city1 = FactoryGirl.create(:city, name: "Benicarlo")
      city2 = FactoryGirl.create(:city, name: "Benicassim")
      FactoryGirl.create(:school, name: "IES 1", city: city1)
      FactoryGirl.create(:school, name: "IES 2", city: city2)
      post 'show', :query => "Beni"
      response.should render_template("search/cities")
      # TODO: algo no va bien en 'page', sale vacio
      #page.should have_link "/cities/1"
      #page.should have_link "/cities/2"
    end
  end

end
