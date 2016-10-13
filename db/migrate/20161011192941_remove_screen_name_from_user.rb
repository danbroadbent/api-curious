class RemoveScreenNameFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_columns :users, :screen_name, :oauth_token_secret
  end
end
