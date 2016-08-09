class PlayerMedal < ActiveRecord::Base
	belongs_to :player
	belongs_to :medal
end
