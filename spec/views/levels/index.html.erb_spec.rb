require 'spec_helper'

describe "levels/index" do
  context "with param city with schools in root levels" do
    before do
      @levels = []
      @levels << stub_model(Level, id: 1, name: "infantil", total: 5, parent_id: nil)
      @levels << stub_model(Level, id: 2, name: "ESO", total: 3, parent_id: nil)
      @levels << stub_model(Level, id: 3, name: "Bachiller", total: 2, parent_id: nil)

      @city = mock_model(City, id: 1, name: "Burjassot")

      assign(:levels, @levels)
      assign(:city, @city)
      assign(:filter, { city_id: @city.id})

      render
    end

    it "shows a list of root levels with links to sublevels from that city" do
      @levels.each do |level|
        rendered.should have_selector("td##{level.id}") do |td|
          td.should contain(level.id)
          td.should contain(level.total)
          # TODO: test params (?city_id=n)
          td.should have_selector("a", href: level(1, level))
        end
      end
    end
  end
end
