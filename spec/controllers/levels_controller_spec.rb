require 'spec_helper'


describe LevelsController do
  before (:each) do
    @burjassot = FactoryGirl.create(:city, name: "Burjassot") 
    @infantil = FactoryGirl.create(:level, :name => "Infantil") 
    @bachiller = FactoryGirl.create(:level, name: "Bachiller")
    @bachiller_humanistico = FactoryGirl.create(:level, name: "Bachiller humanistico", parent: @bachiller)
    @bachiller_cientifico = FactoryGirl.create(:level, name: "Bachiller cientifico", parent: @bachiller)

    FactoryGirl.create_list(:school, 4, city: @burjassot, levels: [@infantil])
    FactoryGirl.create_list(:school, 5, city: @burjassot, levels: [@bachiller, @bachiller_humanistico])
    FactoryGirl.create_list(:school, 6, city: @burjassot, levels: [@bachiller, @bachiller_cientifico])
  end

  describe "GET 'show'" do
    context "with level without children and city param" do
      before (:each) do
        get 'show', :id => @infantil.id, :city_id => @burjassot.id
      end

      it "returns all cities with that level" do
        assigns(:schools).count.should eq(4) 
      end
    end

    context "with level with children and city param" do
      before (:each) do
        get 'show', :id => @bachiller.id, :city_id => @burjassot.id
      end

      it "returns a list of sublevels of that level" do
        # TODO: crear caso en el que los niveles tengan subniveles.
        # OPCIONES:
        #   1.- Mostrar solo subniveles y cantidad de centros en cada subnivel
        #   2.- Mostrar subniveles y cantidad, y un listado de los centros para el nivel actual.
        #   3.- Mostrar subniveles y cantidad, un listado de centros para el nivel actual y columnas con los subniveles que tienen.

        pending
      end
    end
  end

  describe "GET 'index'" do
    context "with a city param" do
      before(:each) do
        get 'index', :city_id => @burjassot.id
      end

      it "returns a list of root levels with schools in that city" do
        levels = assigns(:levels).map { |l| l.name }

        levels.should include("Infantil","Bachiller")
        levels.count.should eq(2)
      end

    end

    context "without a city param" do
      it "returns a list of root levels with schools of all cities" do
        pending
      end
    end
  end
end
