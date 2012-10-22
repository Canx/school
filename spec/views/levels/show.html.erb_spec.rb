require 'spec_helper'

describe "levels/show" do
  context "city and level" do
    before(:each) do
      @city = mock_model(City, name: "Burjassot")
      @schools = (1..5).collect { mock_model(School, city: @burjassot, levels: [@infantil]) }
      @level = mock_model(Level, name: "infantil")
      @sublevels = []

      assign(:schools, @schools)
      assign(:city, @city)
      assign(:level, @level)
      assign(:sublevels, @sublevels)
      render
    end

    it "shows the level" do
      rendered.should have_selector("div", class: "level", id: @level.id)
    end

    it "shows a list of schools from the specified city and level, with links to schools" do
      @schools.each do |school|
        rendered.should have_selector("div", class: "school", id: school.id)
        # TODO: inside that selector must be a link to a school
      end
    end
  end

  context "city and level with sublevels" do
    before(:each) do
      @city = mock_model(City, name: "Burjassot")
      @level = mock_model(Level, name: "Bachiller")
      @sublevels = []
      @sublevels << mock_model(Level, name: "Bachiller Humanistico")
      @sublevels << mock_model(Level, name: "Bachiller cientifico")
      @schools = []
      @schools << mock_model(School, name: "IES XXXX")

      assign(:sublevels, @sublevels)
      assign(:schools, @schools)
      assign(:level, @level)
      assign(:city, @city)

      render
    end

    it "shows a list of sublevels of that level" do
      @sublevels.each do |sublevel|
        rendered.should have_selector("div.sublevel##{sublevel.id}")
        rendered.should have_link(sublevel.name, href: city_level_path(@city, sublevel))
      end
    end

    it "shows the level" do
      rendered.should have_selector("div.level##{@level.id}")
    end

    it "shows a list of schools from the specified city and level, with links to schools" do
      @schools.each do |school|
        rendered.should have_selector("div.school##{school.id}")
        rendered.should have_link(school.name, href: school_path(school))
      end
    end
  end
end
