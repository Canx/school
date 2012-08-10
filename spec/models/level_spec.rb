require 'spec_helper'

describe Level do
  it "should not allow two levels with the same name" do
    infantil1 = Level.new(:name => "infantil")
    infantil2 = Level.new(:name => "infantil")
    infantil1.save
    infantil2.save
    infantil2.should have(1).error_on(:name)
  end
end
