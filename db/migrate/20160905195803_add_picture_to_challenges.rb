class AddPictureToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :picture, :string
  end
end
