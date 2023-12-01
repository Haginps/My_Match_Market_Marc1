class CreateTokenHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :token_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.float :total_token

      t.timestamps
    end
  end
end
