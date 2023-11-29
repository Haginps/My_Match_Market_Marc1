class CreateHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :histories do |t|
      t.references :investment, null: false, foreign_key: true
      t.date :date
      t.float :price

      t.timestamps
    end
  end
end
