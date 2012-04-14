require 'factory_girl'

FactoryGirl.define do
  factory :school do 
    name 'IES Prueba'
    city 'Burjassot'
  end
end

FactoryGirl.define do
  factory :level do 
    name 'Primaria'
  end
end

FactoryGirl.define do
  factory :schools_level do
    association :level
    association :school
  end
end
