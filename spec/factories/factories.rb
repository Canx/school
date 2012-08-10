require 'factory_girl'

FactoryGirl.define do
  factory :city do
    name 'Valencia'
  end

  factory :school do 
    name 'IES Prueba'
    city
  end

  factory :level do 
    name 'Primaria'
  end

  factory :schools_level do
    association :level
    association :school
  end
end
