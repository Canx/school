class School < ActiveRecord::Base
  has_and_belongs_to_many :levels, uniq: true
  belongs_to :city

  validates :city, :presence => true
  validates :code, :presence => true, :uniqueness => true

  attr_accessible :name, :city, :phone, :address

  scope :from_city, lambda { |city_id| School.where(city_id: city_id) }
  scope :with_level, lambda { |level_id| School.joins(:levels).where(levels: {id: level_id}) }
  scope :like, lambda { |query| School.where(["name LIKE ?", "%#{query}%"]) }

  def self.find_by_filter(filter)
    param_scope = [[:level_id, "with_level"], [:city_id, "from_city"], [:query, "like"]]

    param_scope.inject(self) do |query, (param,scope)|
      !filter[param].nil? ? query.send(scope,filter[param]) : query 
    end
  end
end
