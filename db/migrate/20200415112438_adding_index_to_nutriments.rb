class AddingIndexToNutriments < ActiveRecord::Migration[6.0]
  def change
    add_index :nutriments, :author_id
  end
end
