require 'spec_helper'

describe Level do
  it "should not allow two levels with the same name" do
    create(:level, :name => "infantil")
    expect { create(:level, :name => "infantil") }.to raise_error
  end

  it "should not allow create a new level with a non-existent parent" do
    level0 = create(:level, :name => "non-saved level")
    level0.delete
    expect { create(:level, :name => "nivel1", :parent => level0) }.to raise_error
  end

  describe ".total_schools_by_city" do
    it "should return root levels with total schools from a city" do
      pending
    end
  end
end
