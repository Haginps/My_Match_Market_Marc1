class CreateTradeHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :trade_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.integer :shares_amount
      t.references :holding, null: false, foreign_key: true

      t.timestamps
    end
  end
end
