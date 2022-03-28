class PlayersController < ApplicationController
  def index
    @players = Player.all
  end  

  def show
    @hands = Hands.where(player_id: params[:id])
  end
end