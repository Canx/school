When /^I search for schools in "(.*?)" and level "(.*?)"$/ do |city, level|
  visit("/search")
  fill_in('query', :with => city)
  select(level, :from => 'level')
  click_button('Buscar')
end

Then /^the results should be:$/ do |expected_results|
  results = [["name"]] + page.all('td#name').map do |td|
    [td.text]
  end
  expected_results.diff!(results)
end
