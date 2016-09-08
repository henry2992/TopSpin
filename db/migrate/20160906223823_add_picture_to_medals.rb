class AddPictureToMedals < ActiveRecord::Migration
  def change
    add_column :medals, :picture, :string
  end
end
