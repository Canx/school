Given /^there are the following school profiles:$/ do |schools|
  schools.hashes.each do |hash|
    FactoryGirl.create(:school, hash) 
  end
end
