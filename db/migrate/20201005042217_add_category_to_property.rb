class AddCategoryToProperty < ActiveRecord::Migration[6.0]
  def change
    add_reference :properties, :category, null: false, foreign_key: true
  end
end
