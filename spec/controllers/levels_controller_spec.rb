require 'spec_helper'

describe LevelsController do

  describe "GET 'show'" do
    before(:each) do
      @burjassot = FactoryGirl.create(:city, name: "Burjassot")
      @infantil = FactoryGirl.create(:level, name: "infantil")
      @secundaria = FactoryGirl.create(:level, name: "secundaria")
      FactoryGirl.create_list(:school, 5, city: @burjassot, levels: [@infantil])
      FactoryGirl.create_list(:school, 10, city: @burjassot, levels: [@secundaria])
    end
    
    context "with level and city param" do
      it "returns a list of schools from that city and level" do
        get 'show', :id => @infantil.id, :city_id => @burjassot.id
        assigns(:schools).count.should eq(5)
      end
    end
  end
end
