When /^I search for "([^"]*)"$/ do |query|
  visit("/search")
  fill_in('query', :with => query)
  click_button('Buscar')
end

Then /^the results should be:$/ do |expected_results|
  results = page.all('ol.results li').map do |li|
    [li.text]
  end
  expected_results.diff!(results)
end
