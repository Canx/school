require 'spec_helper'

describe "cities/show" do
  context "querying a city with schools in different levels"
    before do
      data = [[1,"infantil",10, nil],[2,"ESO",15, nil],[3,"bachiller",20, nil],[4,"bachiller humanidades",10,3]]

      @levels = []

			# TODO: change stub to factory
      data.each do |row|
        @levels << stub_model(School, :id => row[0], :name => row[1], :total => row[2], :parent_id => row[3])
      end

      @city = stub_model(City, :name => "Burjassot")

      assign(:levels, @levels)
      assign(:id, 1)
      assign(:city, @city)

			render
    end

		it "shows a list of links to city levels and the number of schools in each level" do
			@levels.each do |level|
				rendered.should have_selector("td##{level.id}") do |td|
					td.should contain(level.id)
					td.should contain(level.total)
					td.should have_selector("a", href: city_level(1, level))
				end
			end
		end

		it "shows only top levels" do
			# TODO: create array with sublevels and test all sublevels
      rendered.should_not have_selector("td#4")
		end
end
