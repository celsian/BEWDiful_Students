class GamesController < ApplicationController
  def index
    @games = Game.all
    @game = Game.new
  end

  def set_winner
    @player = Player.find(params[:player])
    @game = Game.find(params[:game])
    @game.winner = @player
    @game.save
    redirect_to games_path
  end


  def new
    @game = Game.new
    @players = Player.all
  end

  def create
    @player1 = Player.find(params[:player1][:id])
    @player2 = Player.find(params[:player2][:id])

    if @player1 == @player2
      redirect_to new_game_path, flash: {error: "Player's must be unique."}
    else
      @game = Game.new
      @game.players << @player1
      @game.players << @player2

      if @game.save
        redirect_to games_path
      else
        redirect_to new_game_path, flash: {error: "Something wrong..."}
      end
    end
  end
  
  def destroy
    Game.find(params[:id]).destroy
    
    redirect_to games_path, flash: {success: "Game was deleted."}
  end

end
