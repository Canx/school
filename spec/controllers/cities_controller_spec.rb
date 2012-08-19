require 'spec_helper'

describe CitiesController do

  describe "GET 'show'" do
    before(:each) do
      @burjassot = FactoryGirl.create(:city, name: "Burjassot")
      @infantil = FactoryGirl.create(:level, name: "infantil")
      @secundaria = FactoryGirl.create(:level, name: "secundaria")
      FactoryGirl.create_list(:school, 5, city: @burjassot, levels: [@infantil])
      FactoryGirl.create_list(:school, 10, city: @burjassot, levels: [@secundaria])
    end

    it "returns http success" do
      get 'show', :id => @burjassot.id
      response.should be_success
    end

    it "returns a list of levels and the number of schools in each level" do
      get 'show', :id => @burjassot.id

      #assigns(:levels).size.should eq(2)
      assigns(:levels).first.total.should eq(5)
      assigns(:levels).second.total.should eq(10)
    end
  end
end