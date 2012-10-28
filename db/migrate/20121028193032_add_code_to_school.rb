class AddCodeToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :code, :string
    add_index :schools, :code
  end
end
