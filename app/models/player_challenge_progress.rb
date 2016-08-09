class PlayerChallengeProgress < ActiveRecord::Base

  belongs_to :player_challenge
  

  belongs_to :challenge
  belongs_to :step

	
end
