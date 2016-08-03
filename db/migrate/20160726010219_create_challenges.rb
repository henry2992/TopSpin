class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :description
      t.integer :points
      t.belongs_to :level, index: true

      t.timestamps null: false
    end
  end
end
