class CreateInvestments < ActiveRecord::Migration[7.1]
  def change
    create_table :investments do |t|
      t.string :name
      t.string :abbreviation
      t.float :rating
      t.string :category
      t.string :description
      t.string :image
      t.float :previousdaypercentchange

      t.timestamps
    end
  end
end
