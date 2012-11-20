require 'spec_helper'

describe School do
  it "should not allow two schools with the same code" do
    create(:school, :code => "12345")
    expect { build(:school, :code => "12345") }.to raise_error
  end

  it "should not allow a school without name" do
    school = build(:school, :name => nil)
    school.save
    school.should have(1).error_on(:name)
  end

  it "should not allow a school without city" do
    school = build(:school, :name => "IES La Vereda", :city => nil)
    school.save
    school.should have(1).error_on(:city)
  end

  it "should not allow to have repeated levels for a school" do
    level = create(:level, :name => "Bachiller")
    school = create(:school, :name => "IES La Vereda", levels: [level])
    school.levels << level
    school.save

    school.levels.count.should eq(1)
  end
end
