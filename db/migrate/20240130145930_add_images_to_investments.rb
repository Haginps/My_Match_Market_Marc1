class AddImagesToInvestments < ActiveRecord::Migration[7.1]
  def change
    add_column :investments, :team_logo_image, :string
    add_column :investments, :country_flag_image, :string
  end
end
