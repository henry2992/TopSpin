class PlayerChallenge < ActiveRecord::Base

	belongs_to :user
	belongs_to :challenge
	has_many :player_challenge_progresses


	def assing_medal(player, medal) 
	    PlayerMedal.first_or_create(player_id: player, medal_id: medal)
	end

	def erase_medal(player, medal) 
		PlayerMedal.where( ["player_id = ? and medal_id = ?",  player, medal] ).destroy_all
	end

  	
	def progress_percent
		(player_challenge_progresses.where(completed: true).count * 100) / total_challenges
  	end


  	def total_challenges
  		Step.where(challenge_id: challenge.steps.map(&:id)).count
  	end

end
