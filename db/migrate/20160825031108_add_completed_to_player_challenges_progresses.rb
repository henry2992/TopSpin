class AddCompletedToPlayerChallengesProgresses < ActiveRecord::Migration
  def change
    add_column :player_challenge_progresses, :completed, :boolean, :default => true
  end
end
