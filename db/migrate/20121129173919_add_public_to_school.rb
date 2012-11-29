class AddPublicToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :public, :boolean
  end
end
