class School < ActiveRecord::Base
  has_and_belongs_to_many :levels, uniq: true
  belongs_to :city

  validates :city, :presence => true
  validates :name, :presence => true, :uniqueness => true

  attr_accessible :name, :city

  scope :from_city, lambda { |city_id| School.where(city_id: city_id) }
  scope :with_level, lambda { |level_id| School.joins(:levels).where(levels: {id: level_id}) }

end
