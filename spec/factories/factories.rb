require 'factory_girl'

FactoryGirl.define do
  factory :city do
    name 'Valencia'
  end

  factory :level do 
    name 'Primaria'
  end

  factory :school do 
    sequence(:name) { |n| "IES #{n}" }
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
