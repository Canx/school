When /^I search for schools in "(.*?)"$/ do |city|
  visit search_url
  fill_in('query', :with => city)
  click_button('Buscar')
end

When /^I click on "(.*?)" city$/ do |city_name|
  id = City.find_by_name(city_name).id
  click_link("#{id}")
end

Then /^the results should be:$/ do |expected_results|
  results = []
  expected_results.column_names.each do |column_name|
    column = [[column_name]] + page.all("##{column_name}").map do |element|
      [element.text]
    end
    results << column.flatten
  end 
  expected_results.diff!(results.transpose)
end
