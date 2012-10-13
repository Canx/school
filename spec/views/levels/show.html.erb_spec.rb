require 'spec_helper'

describe "levels/show" do
  before(:each) do
    @burjassot = create(:city, name: "Burjassot")
    @infantil = create(:level, name: "infantil")
    @secundaria = create(:level, name: "secundaria")

    @schools = create_list(:school, 5, city: @burjassot, levels: [@infantil])
    create_list(:school, 10, city: @burjassot, levels: [@secundaria])
  end

  context "city and level without sublevels" do
    before(:each) do
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
  end

  context "city and level with sublevels" do
    it "shows a list of sublevels of that level" do
      pending
    end
  end
end
