When /^I search for schools with "([^"]*)" in its name$/ do |query|
  visit("/search")
  fill_in('query', :with => query)
  click_button('Buscar')
end

When /^I search for schools in "([^"]*)" city$/ do |city|
  visit("/search")
  fill_in('query', :with => city)
  select('Ciudad', :from => 'tipoBusqueda')
  click_button('Buscar')
end

When /^I search for schools of level "([^"]*)"$/ do |level|
  visit("/search")
  select(level, :from => 'nivel')
  click_button('Buscar')
end

Then /^the results should be:$/ do |expected_results|
  results = [["name"]] + page.all('td#name').map do |td|
    [td.text]
  end
  expected_results.diff!(results)
end
