class CreateNutrimentGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :nutriment_groups do |t|
      t.integer :nutriment_id
      t.integer :group_id

      t.timestamps
    end
  end
end
