class MedalsController < ApplicationController
  
	before_action :set_medals, only: [:index]

	def index
	  	@medals = Medal.all.where.not(id: @player_medal.where(player_id: current_player ).map(&:medal_id)).order(:id)

	  	# @steps_completed = @challenge.steps.all.where.not(id: PlayerChallengeProgress.where(player_challenge: @player_challenge).map(&:step_id)).order(:id) if @challenge
    

	end


    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_medals
      @player_medal = current_player.player_medals
  	
    end

   

end
