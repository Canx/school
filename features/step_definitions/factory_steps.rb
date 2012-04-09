Given /^there are the following school profiles:$/ do |schools|
  schools.rows.flatten.each do |school_name|
    FactoryGirl.create(:school, name: school_name) 
  end
end
