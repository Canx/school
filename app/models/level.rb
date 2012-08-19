class Level < ActiveRecord::Base
  has_and_belongs_to_many :schools
  validates :name, :presence => true, :uniqueness => true

  attr_accessible :name
end
