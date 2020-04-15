class AddingIndexToGroups < ActiveRecord::Migration[6.0]
  def change
    add_index :groups, :author_id
  end
end
