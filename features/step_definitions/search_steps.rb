When /^I search for schools with "([^"]*)" in its name$/ do |query|
  visit("/search")
  fill_in('query', :with => query)
  click_button('Buscar')
end

Then /^the results should be:$/ do |expected_results|
  results = [["name"]] + page.all('ol.results li').map do |li|
    [li.text]
  end
  expected_results.diff!(results)
end
