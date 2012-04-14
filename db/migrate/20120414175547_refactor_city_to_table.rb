class RefactorCityToTable < ActiveRecord::Migration
  def up
    # TODO: create table cities
    create_table :cities do |t|
      t.integer :id
      t.string  :name
    end
    # TODO: delete city column in schools table
    remove_column :schools, :city
    # TODO: add city_id in schools table 
    add_column :schools, :city_id, :integer
  end

  def down
    drop_table :cities
    add_column :schools, :city, :string
    remove_column :schools, :city_id
  end
end
