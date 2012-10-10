require 'spec_helper'

describe "levels/show" do
  context "given a city with schools having different levels" do
    before(:each) do
      @burjassot = create(:city, name: "Burjassot")
      @infantil = create(:level, name: "infantil")
      @secundaria = create(:level, name: "secundaria")

      @schools = create_list(:school, 5, city: @burjassot, levels: [@infantil])
      create_list(:school, 10, city: @burjassot, levels: [@secundaria])
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
