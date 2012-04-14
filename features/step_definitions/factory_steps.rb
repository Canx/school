Given /^there are the following levels:$/ do |levels|
  levels.hashes.each do |level|
    FactoryGirl.create(:level, :name => level[:name])
  end
end

Given /^there are the following school profiles:$/ do |schools|
  schools.hashes.each do |school_row|
    city = FactoryGirl.create(:city, name: school_row[:city])
    school_row["city"] = city
    levels = school_row.delete("levels")
    school = FactoryGirl.build(:school, school_row)
    unless levels.nil? 
      levels.split(",").map do |level|
          school.levels << Level.find_by_name!(level.strip)
      end
    end
    
    school.save!
  end
end
