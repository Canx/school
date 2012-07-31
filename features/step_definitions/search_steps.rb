When /^I search for schools in "(.*?)" and level "(.*?)"$/ do |city, level|
  visit search_url
  fill_in('query', :with => city)
  select(level, :from => 'level')
  click_button('Buscar')
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
