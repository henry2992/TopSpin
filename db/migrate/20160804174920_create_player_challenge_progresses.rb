class CreatePlayerChallengeProgresses < ActiveRecord::Migration
  def change
    create_table :player_challenge_progresses do |t|
      t.integer :player_challenge_id
      t.integer :challenge_id
      t.integer :step_id
      t.timestamps null: false
    end
  end
end
