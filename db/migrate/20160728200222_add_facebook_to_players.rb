class AddFacebookToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :provider, :string
    add_column :players, :uid, :string
    add_column :players, :oauth_token, :string
    add_column :players, :oauth_expires_at, :datetime
  end
end
