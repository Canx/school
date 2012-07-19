class School < ActiveRecord::Base
  has_and_belongs_to_many :levels
  belongs_to :city

  validates :city, :presence => true
  validates :name, :presence => true, :uniqueness => true

  attr_accessible :name, :city

end
