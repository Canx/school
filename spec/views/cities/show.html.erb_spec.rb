require 'spec_helper'

describe "cities/show.html.erb" do
  context "given a city with schools in different levels"
    before do
      @levels = []
      data = [[1,"infantil",10],[2,"ESO",15],[3,"bachiller",20]]
      data.each do |row|
        @levels << stub_model(School, :id => row[0], :name => row[1], :total => row[2])
      end
      assign(:levels, @levels)
      assign(:id, 1)
    end

    context "querying with an existing city" do
      it "shows a list of links to city levels and the number of schools in each level" do
        render 
        @levels.each do |level|
          rendered.should have_selector("td##{level.id}") do |td|
            td.should contain(level.id)
            td.should contain(level.total)
          end
        end
      end
    end
end
