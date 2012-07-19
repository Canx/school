When /^I go to the "(.*?)" school page$/ do |name|
    @school=School.find_by_name(name)
    visit("/schools/#{@school.id}")
end

Then /^I should see its name, city and levels$/ do
    within('#school') do
      page.should have_content(@school.name)
      page.should have_content(@school.city.name)
      @school.levels.each { |level| page.should have_content(level.name) }
    end
end
