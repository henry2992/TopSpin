class ChallengesController < ApplicationController
  
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]

  def index
  	@challenges = Challenge.all
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

