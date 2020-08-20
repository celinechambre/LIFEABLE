class AddCityStyleJobToLives < ActiveRecord::Migration[6.0]
  def change
  	add_column :lives, :city, :string
  	add_column :lives, :job, :string
  	add_column :lives, :lifestyle, :string
  end
end
