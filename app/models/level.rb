
class Level < ActiveRecord::Base
  has_and_belongs_to_many :schools
  validates :name, :presence => true, :uniqueness => true
  belongs_to :parent, :class_name => "Level", :foreign_key => "parent_id"
  has_many :children, :class_name => "Level", :foreign_key => "parent_id", :inverse_of => :parent

  scope :base, where(:parent_id => nil)
  attr_accessible :name, :parent
end
