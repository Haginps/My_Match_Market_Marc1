class DropAssets < ActiveRecord::Migration[7.1]
  def change
    drop_table :assets
  end
end
