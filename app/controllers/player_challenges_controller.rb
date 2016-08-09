class PlayerChallengesController < ApplicationController

	before_action :set_player_challenge, only: [:show]
	before_action :set_challenge, only: [:show]

  before_action :completed?, only: [:show]

	def show
	
  end

  def complete_task
    @pc = PlayerChallenge.find(params[:player_challenge_id])
    @chall = Challenge.find(params[:challenge_id])
    @st =  Step.find(params[:step_id])
    PlayerChallengeProgress.where(player_challenge_id: @pc, challenge_id: @chall, step_id: @st ).first_or_create
    
    
    if @pc.progress_percent == 100
      @pc.completed = true
      @pc.save!
      @pc.assing_medal(current_player.id, @chall.medal.id)
      redirect_to :back, medal_notification: "You won a medal"
    else
      redirect_to :back
    end
 

  end


	private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_player_challenge
      @player_challenge = PlayerChallenge.find(params[:id])
      @progress = @player_challenge.progress_percent
    end

    def set_challenge
      @challenge = Challenge.find(params[:challenge_id])
      @medal = @challenge.medal
    end

    def completed?
      unless @player_challenge.progress_percent == 100
        @player_challenge.erase_medal(current_player.id, @medal.id)
      end 
    end
    # http://localhost:3000/challenges/1/player_challenges/2

   
end


# PlayerChallenge.where(player_id: current_player, challenge_id: params[:challenge_id]).first_or_create!
	