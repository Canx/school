class AddLatitudeAndLongitudeToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :lat, :float
    add_column :schools, :long, :float
  end
end
