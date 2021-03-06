class ChallengesController < ApplicationController
  
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_player!



  def index

    if (params[:challenge])  
        @challenges = Challenge.all.where.not(id: PlayerChallenge.where(player_id: current_player, completed: true ).map(&:challenge_id)).has_level(params[:challenge][:has_level]) 
    else
      @challenges = Challenge.all.where.not(id: PlayerChallenge.where(player_id: current_player, completed: true ).map(&:challenge_id))
    end

    @player_medals = current_player.player_medals.first(3)

    @player_rank = current_player.my_rank
    
  end


  def show
    player_challenge = PlayerChallenge.where(player_id: current_player.id, challenge_id: @challenge.id).first_or_create
    redirect_to challenge_player_challenge_path(@challenge, player_challenge)
  end


  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end


  
    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.require(:challenge).permit(:name, :description, :points)
    end

    

  
end

