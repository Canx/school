class Level < ActiveRecord::Base
  has_and_belongs_to_many :schools
  attr_accessible :name
end
