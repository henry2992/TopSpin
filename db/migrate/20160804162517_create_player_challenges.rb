class CreatePlayerChallenges < ActiveRecord::Migration
  def change
    create_table :player_challenges do |t|
      t.integer :player_id
      t.integer :challenge_id

      t.timestamps null: false
    end
  end
end
