class ChallengesController < ApplicationController
  
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_player!

  def index

    if (params[:challenge])
       @challenges = Challenge.has_level(params[:challenge][:has_level]) 
    else
      @challenges = Challenge.all
    end

  	
  end


  def player_challenges
    PlayerChallenge.where(player_id: current_player, challenge_id: params[:challenge_id]).first_or_create
    # redirect_to challenges_path    
    @player_challenges = current_player.player_challenges.all

  end


  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenges.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.require(:challenge).permit(:name, :description, :points)
    end

    


end

