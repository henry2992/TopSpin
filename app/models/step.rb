class Step < ActiveRecord::Base
	belongs_to :challenge
	has_many :player_challenge_progresses
end
