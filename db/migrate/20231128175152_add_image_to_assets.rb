class AddImageToAssets < ActiveRecord::Migration[7.1]
  def change
    add_column :assets, :image, :string
  end
end
