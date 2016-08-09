class CreateMedals < ActiveRecord::Migration
  def change
    create_table :medals do |t|
      t.string :name
      t.string :description
      t.integer :challenge_id

      t.timestamps null: false
    end
  end
end
