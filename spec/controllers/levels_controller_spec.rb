
require 'spec_helper'


describe LevelsController do
  before (:each) do
    @city = FactoryGirl.create(:city, name: "Burjassot") 
    @infantil = FactoryGirl.create(:level, :name => "Infantil") 
    @bachiller = FactoryGirl.create(:level, name: "Bachiller")
    @bachiller_humanistico = FactoryGirl.create(:level, name: "Bachiller humanistico", parent: @bachiller)
    @bachiller_cientifico = FactoryGirl.create(:level, name: "Bachiller cientifico", parent: @bachiller)
    @bachiller_artistico = FactoryGirl.create(:level, name: "Bachiller artistico", parent: @bachiller)

    FactoryGirl.create_list(:school, 4, city: @city, levels: [@infantil])
    FactoryGirl.create_list(:school, 5, city: @city, levels: [@bachiller, @bachiller_humanistico])
    FactoryGirl.create_list(:school, 6, city: @city, levels: [@bachiller, @bachiller_cientifico])
    FactoryGirl.create_list(:school, 7, city: @city, levels: [@bachiller, @bachiller_cientifico, @bachiller_humanistico])
  end

  describe "GET 'show'" do
    context "with level without children and city param" do
      before (:each) do
        get 'show', :id => @infantil.id, :city_id => @city.id
      end

      it "returns all schools with that level and city" do
        assigns(:schools).count.should eq(4) 
      end
    end

    context "with level with children and city param" do
      before (:each) do
        get 'show', :id => @bachiller.id, :city_id => @city.id
      end

      it "returns schools and a list of sublevels of that level" do
        assigns(:level).should eq(@bachiller)
        assigns(:sublevels).should include(@bachiller_cientifico, @bachiller_humanistico)
        assigns(:sublevels).size.should eq(2)
        assigns(:schools).size.should eq(18)
      end
    end
  end

  describe "GET 'index'" do
    context "with a city param" do
      before(:each) do
        get 'index', filter: { city_id: @city.id }
      end

      it "returns a list of root levels with schools in that city" do
        assigns(:levels).should include(@infantil, @bachiller)
        assigns(:levels).size.should eq(2)
      end
    end

    context "without a city param" do
      it "returns a list of root levels with schools of all cities" do
        pending
      end
    end
  end
end
