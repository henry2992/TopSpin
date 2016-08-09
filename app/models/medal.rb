class Medal < ActiveRecord::Base

	belongs_to :challenge

	has_many :player_medals
end
