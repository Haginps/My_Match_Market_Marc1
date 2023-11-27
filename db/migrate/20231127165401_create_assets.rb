class CreateAssets < ActiveRecord::Migration[7.1]
  def change
    create_table :assets do |t|
      t.string :name
      t.string :abbreviation
      t.float :rating

      t.timestamps
    end
  end
end
