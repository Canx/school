require 'spec_helper'

describe CitiesController do

  describe "GET 'show'" do
    before(:all) do
      # FIXME: conseguir que funcionen estas factorias
      #FactoryGirl.create_list(:school, 10, level: ["infantil"])
      #FactoryGirl.create_list(:school, 10, level: ["secundaria"])
    end

    context "without params" do
      it "returns http success" do
        get 'show', :id => 1
        response.should be_success
      end

      it "returns a list of schools grouped by level" do
        pending
      end
    end

    context "with level param" do
      it "return a list of schools having a concrete level" do
        pending
      end
    end
  end

end
