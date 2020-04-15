class AddingIndexToNutrimentGroups < ActiveRecord::Migration[6.0]
  def change
    add_index :nutriment_groups, :nutriment_id
    add_index :nutriment_groups, :group_id
    add_index :nutriment_groups, [:nutriment_id, :group_id]
  end
end
