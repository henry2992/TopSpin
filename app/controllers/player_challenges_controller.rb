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
    
    
    if @pc.progress_percent == 100 and !@pc.points_assigned? 
      
      @pc.completed = true
      @pc.points_assigned = true
      @pc.save!

      @pc.assing_medal(current_player.id, @chall.medal.id)


      current_player.points = current_player.points + @chall.points
      current_player.save!

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
        # If not completed Take Away medal
        @player_challenge.erase_medal(current_player.id, @medal.id) 
      end 
    end
   
end


# PlayerChallenge.where(player_id: current_player, challenge_id: params[:challenge_id]).first_or_create!
	