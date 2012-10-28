require 'spec_helper'

describe "schools/show" do
  context "given a school data" do
    before(:each) do
      @sublevels = []
      @sublevels << mock_model(Level, id: 4, name: "Humanistico", children: nil, parent_id: 3)
      @sublevels << mock_model(Level, id: 5, name: "Cientifico", children: nil, parent_id: 3)
      @levels = []
      @levels << mock_model(Level, id: 1, name: "infantil", children: nil, parent_id: nil)
      @levels << mock_model(Level, id: 2, name: "ESO", children: nil, parent_id: nil)
      @levels << mock_model(Level, id: 3, name: "Bachiller", children: @sublevels, parent_id: nil)

      @city = mock_model(City, id: 1, name: "Pobla de Vallbona")
      @school = mock_model(School, id: 1, name: "IES La Vereda", city: @city, levels: @levels,
                           address: "Calle de la Vereda, s/n", 
                           phone: "964333333",
                           email: "ieslavereda@gmail.com")
      render
    end
  end

  it "should show school name" do
    rendered.should have_selector("span", class: "name")
  end

  it "should show city school name" do
    rendered.should have_selector("span", class: "city")
  end

  it "should show schools levels" do
    pending
    #[1..3].each { |n| rendered.should have_selector("li.level##{n}")
    #[4..5].each { |n| rendered.should have_selector("li.sublevel##{n}")
  end

  it "should show phone school" do
    rendered.should have_selector("span", class: "phone")
  end

  it "should show school gps position" do
    pending
  end

  it "should show address school" do
    rendered.should have_selector("span", class: "address")
  end
end
