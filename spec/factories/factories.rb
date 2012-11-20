require 'factory_girl'

FactoryGirl.define do
  factory :city do
    name 'Valencia'
  end

  factory :level do 
    name 'Primaria'
    parent nil
  end

  sequence(:name) { |n| "IES #{n}" }
  sequence(:code) { |n| "#{n}" }

  factory :school do
    name { FactoryGirl.generate(:name) }
    code { FactoryGirl.generate(:code) }
    city
    levels do
      if Level.count > 0
        [Level.first]
      else 
        [FactoryGirl.create(:level)] 
      end
    end
  end
end
