class School < ActiveRecord::Base
  has_and_belongs_to_many :levels
  attr_accessible :name

  def self.like(query, row)
    where(["schools.#{row} LIKE ?", "%#{query}%"])
  end
end
