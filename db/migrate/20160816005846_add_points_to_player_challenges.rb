class AddPointsToPlayerChallenges < ActiveRecord::Migration
  def change
    add_column :player_challenges, :points_assigned, :boolean, :default => false
  end
end
