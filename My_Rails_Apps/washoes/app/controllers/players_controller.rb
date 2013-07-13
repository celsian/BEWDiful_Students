class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new player_params

    if @player.save #If it can save, redirects to movie path, otherwise renders new page again (and errors are displayed)
      redirect_to players_path
    else
      render :new
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])

    if @player.update_attributes(player_params) #If it can save, redirects to movie path, otherwise renders new page again (and errors are displayed)
      redirect_to players_path, flash: {success: "Player was updated."}
    else
      render :edit
    end
  end

  def destroy
    Player.find(params[:id]).destroy
    
    redirect_to players_path, flash: {success: "Player was deleted."}
  end

  def picks
    @players = Player.all
    
  end

  def player_params
    params.require(:player).permit(:name, :wins)
  end

end
