class GamesController < ApplicationController
  def index
    @games = Game.all
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
    @points_a = @game.points.find_by(player: @game.players[0])
    @points_b = @game.points.find_by(player: @game.players[1])
    check_winner
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
      @game.initialize_points(@game.players)

      if @game.save
        redirect_to games_path
      else
        redirect_to new_game_path, flash: {error: "Something wrong..."}
      end
    end
  end

  def check_winner #End of Round win check
    if @points_a.total == 21 && @points_b.total == 21 || @points_a.total > 63 && @points_b.total > 63 #sudden death instance.
      @points_a = []
      @points_b = []
      #redirect_to sudden_death
    elsif @points_a.total == 21 || @points_b.total > 63
      @game.winner = @game.players[0]
      @game.save
    elsif @points_b.total == 21 || @points_a.total > 63
      @game.winner = @game.players[1]
      @game.save
    end
  end

  def check_sd_winner #Sudden death win check
    if @points_a.total > @points_b.total
      @game.winner = @game.players[0]
      @game.save
    elsif @points_b.total > @points_a.total
      @game.winner = @game.players[1]
      @game.save
    end
  end

  def set_winner
    @player = Player.find(params[:player])
    @game = Game.find(params[:game])
    @game.winner = @player
    @game.save
    redirect_to games_path
  end
  
  def destroy
    Game.find(params[:id]).destroy
    
    redirect_to games_path, flash: {success: "Game was deleted."}
  end

end
