require 'spec_helper'

describe "levels/show.html.erb" do
  context "given a city with schools having different levels" do
    before(:each) do
      @burjassot = FactoryGirl.create(:city, name: "Burjassot")
      @infantil = FactoryGirl.create(:level, name: "infantil")
      @secundaria = FactoryGirl.create(:level, name: "secundaria")

      @schools = FactoryGirl.create_list(:school, 5, city: @burjassot, levels: [@infantil])
      FactoryGirl.create_list(:school, 10, city: @burjassot, levels: [@secundaria])
      #@schools = School.joins(:levels).where(:city_id => @burjassot.id).where("levels.id = ?", @infantil.id))

      assign(:schools, @schools)
      assign(:city, @burjassot)
      assign(:level, @infantil)
      render
    end

    it "shows a list of schools from the specified city and level, with links to schools" do
      @schools.each do |school|
        rendered.should have_selector("a", id: school.id) 
      end
    end

    it "shows an error when city doesn't exist" do
      pending
    end

    it "shows an error when level doesn't exist" do
      pending
    end
  end
end
