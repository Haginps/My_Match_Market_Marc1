class AddPreviousDayPercentageChangeToAssets < ActiveRecord::Migration[7.1]
  def change
    add_column :assets, :previousdaypercentagechange, :float
  end
end
