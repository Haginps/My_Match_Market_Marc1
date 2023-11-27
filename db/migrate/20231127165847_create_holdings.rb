class CreateHoldings < ActiveRecord::Migration[7.1]
  def change
    create_table :holdings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :asset, null: false, foreign_key: true
      t.float :purchased_price
      t.integer :shares_amount
      t.date :purchased_date
      t.float :sold_price
      t.date :sold_date
      t.float :gain_loss

      t.timestamps
    end
  end
end
