require 'spec_helper'

describe SearchController do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end

    it "returns error when no query is done" do
      get 'show', :query => ""
      flash[:notice].should_not be_nil
    end
  end

end
