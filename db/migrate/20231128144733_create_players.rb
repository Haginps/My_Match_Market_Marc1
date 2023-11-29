class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :position
      t.string :club
      t.integer :height
      t.integer :weight
      t.date :dob
      t.string :nationality
      t.integer :games_played
      t.integer :goals
      t.integer :assists
      t.references :investment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
