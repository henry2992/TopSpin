class LeaderboardsController < ApplicationController
  
  

  def index

   
    @leader_board = Player.leaderboard.revrange(0, 9)

    @players = []

    @leader_board.each do |player|
      @players << Player.find_by_id(player)
    end

    
  	
  end

    

  
end

