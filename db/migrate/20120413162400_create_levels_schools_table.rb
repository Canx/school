class CreateLevelsSchoolsTable < ActiveRecord::Migration
  def up
    create_table :levels_schools, :id => false do |t|
      t.integer :level_id
      t.integer :school_id
    end
    drop_table :schools_levels
  end

  def down
    drop_table :levels_schools
  end
end
