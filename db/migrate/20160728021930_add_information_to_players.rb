class AddInformationToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :first_name, :string
    add_column :players, :last_name, :string
    add_column :players, :avatar, :string
    add_column :players, :points, :integer, default: 0
    add_column :players, :birthday, :date
  end
end
