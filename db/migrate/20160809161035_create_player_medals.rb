class CreatePlayerMedals < ActiveRecord::Migration
  def change
    create_table :player_medals do |t|
      t.integer :player_id
      t.integer :medal_id

      t.timestamps null: false
    end
  end
end
