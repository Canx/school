# TODO: add address, phone, lat. and long, web address, email, postal code
class City < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  scope :like, lambda { |query| City.where(["name LIKE ?", "%#{query}%"]) }
  attr_accessible :name
end
