class AddAttributesToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :pace, :integer
    add_column :players, :shooting, :integer
    add_column :players, :passing, :integer
    add_column :players, :dribbling, :integer
    add_column :players, :defensive, :integer
    add_column :players, :physics, :integer
  end
end
