class CreateUserHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :user_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.float :tokens
      t.float :performance

      t.timestamps
    end
  end
end
