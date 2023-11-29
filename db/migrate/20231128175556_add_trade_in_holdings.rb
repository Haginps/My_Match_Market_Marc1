class AddTradeInHoldings < ActiveRecord::Migration[7.1]
  def change
    add_column :holdings, :trade, :string
  end
end
