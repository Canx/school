require 'spec_helper'

describe City do
  it "should not allow two cities with the same name" do
    create(:city, :name => "Burjassot")
    expect { create(:city, :name => "Burjassot") }.to raise_error
	end
end
