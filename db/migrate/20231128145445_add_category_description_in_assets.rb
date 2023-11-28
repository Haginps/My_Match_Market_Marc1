class AddCategoryDescriptionInAssets < ActiveRecord::Migration[7.1]
  def change
    add_column :assets, :category, :string
    add_column :assets, :description, :string
  end
end
