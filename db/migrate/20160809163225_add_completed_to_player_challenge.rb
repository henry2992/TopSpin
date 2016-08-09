class AddCompletedToPlayerChallenge < ActiveRecord::Migration
  def change
    add_column :player_challenges, :completed, :boolean, :default => false
  end
end
