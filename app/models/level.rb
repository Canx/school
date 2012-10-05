# TODO: añadir campo "uplevel" que haga referencia al nivel superior

class Level < ActiveRecord::Base
  has_and_belongs_to_many :schools
  validates :name, :presence => true, :uniqueness => true
  belongs_to :parent, :class_name => "Level", :foreign_key => "parent_id"
  has_many :children, :class_name => "Level", :foreign_key => "parent_id"

  attr_accessible :name
end
