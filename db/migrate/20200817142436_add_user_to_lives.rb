class AddUserToLives < ActiveRecord::Migration[6.0]
  def change
    add_reference :lives, :user, null: false, foreign_key: true
  end
end
