class AddUniqueIndexToAuthenticationTokenInUsers < ActiveRecord::Migration
  def change
    remove_index :users, :authentication_token
    add_index :users, :authentication_token, unique: true
  end
end
