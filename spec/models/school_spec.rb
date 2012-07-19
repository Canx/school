require 'spec_helper'

describe School do
  it "should not allow two schools with the same name" do
    city = City.new(:name => "Pobla")
    first = School.new(:name => "IES La Vereda", :city => city)
    second = School.new(:name => "IES La Vereda", :city => city)
    city.save
    first.save
    second.save

    second.should have(1).error_on(:name)
  end

  it "should not allow a school without city" do
    school = School.new(:name => "IES La Vereda")
    school.save

    school.should have(1).error_on(:city)
  end
end
