class AddAuthorIdToNutriments < ActiveRecord::Migration[6.0]
  def change
    add_column :nutriments, :author_id, :integer
  end
end
