class AddSchoolsLevelsJoinTable < ActiveRecord::Migration
  def up
    create_table :schools_levels, :id => false do |t|
      t.integer :school_id
      t.integer :level_id
    end
  end

  def down
    drop_table :schools_levels
  end
end
