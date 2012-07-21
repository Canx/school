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
  end

end
