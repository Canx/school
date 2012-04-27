class School < ActiveRecord::Base
  has_and_belongs_to_many :levels
  belongs_to :city
  validates :city, :presence => true
  attr_accessible :name

  def self.like(query, row)
    where(["schools.#{row} LIKE ?", "%#{query}%"])
  end
end
