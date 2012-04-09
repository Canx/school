class School < ActiveRecord::Base
  attr_accessible :name

  def self.like(query)
    where(["name LIKE ?", "%#{query}%"])
  end
end
