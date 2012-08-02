require 'spec_helper'

describe "search/cities" do
  context "given a search with multiple cities in results"
    before do
      @cities = [{ :id => 1, :name => "Benicarlo", :count => 1 },
                 { :id => 2, :name => "Benidorm",  :count => 1 }]
      @cities = Kaminari.paginate_array(@cities).page(params[:page])
      render
    end
    
    it "shows a list of links to the cities results" do
      @cities.each do |city|
        Capybara.string(rendered).find("tr#city_#{city[:id]}").tap do |tr|
          tr.should have_content city[:name]
          tr.should have_content city[:count]
          tr.should have_selector "a", :href => "/cities/#{city[:id]}"
        end
      end
    end
end
