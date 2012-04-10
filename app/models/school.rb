class School < ActiveRecord::Base
  attr_accessible :name

  def self.like(query, row)
    where(["#{row} LIKE ?", "%#{query}%"])
  end
end
