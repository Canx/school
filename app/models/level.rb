
class Level < ActiveRecord::Base
  has_and_belongs_to_many :schools
  validates :name, :presence => true, :uniqueness => true
  belongs_to :parent, :class_name => "Level", :foreign_key => "parent_id"
  has_many :children, :class_name => "Level", :foreign_key => "parent_id", :inverse_of => :parent

	before_save :check_parent
	
  scope :base, where(:parent_id => nil)
  scope :like, lambda { |query| Level.where(["name LIKE ?", "%#{query}%"]) }
  scope :from_city, lambda { |city_id| Level.joins(:schools).where(:schools => { city_id: city_id }).uniq }


  attr_accessible :name, :parent

	def check_parent
		self.parent.nil? or not Level.find(self.parent.id).nil?
	end

  def self.total_schools_by_city(city_id)
    Level.base.
          joins(:schools).
          where(:schools => { city_id: city_id }).
          group("levels.id").
          select("levels.id, levels.name, count(levels.id) as total")
  end

  def self.find_by_filter(filter)
    param_scope = [[:city_id, "from_city"], [:query, "like"]]

    param_scope.inject(self) do |query, (param,scope)|
      !filter[param].nil? ? query.send(scope,filter[param]) : query 
    end
  end

  def root?
    !(Level.base & [self]).empty?
  end
end
