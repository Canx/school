class AddParentIdToLevel < ActiveRecord::Migration
  def change
    add_column :levels, :parent_id, :integer
  end
end
