# TODO: add address, phone, lat. and long, web address, email, postal code
class City < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  has_many :schools
  has_many :levels, :through => :schools

  scope :like, lambda { |query| City.where(["name LIKE ?", "%#{query}%"]) }
  scope :with_level, lambda { |level_id| City.joins(:levels).where(levels: { id: level_id }).uniq }

  attr_accessible :name

  def self.find_by_filter(filter)
    param_scope = [[:level_id, "with_level"], [:query, "like"]]

    param_scope.inject(self) do |query, (param,scope)|
      !filter[param].nil? ? query.send(scope,filter[param]) : query 
    end
  end

end
