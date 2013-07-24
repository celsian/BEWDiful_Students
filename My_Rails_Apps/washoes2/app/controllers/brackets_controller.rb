class BracketsController < ApplicationController
  def index
    @brackets = Bracket.all
  end

  def show
    @bracket = Bracket.find(params[:id])
  end

  def new
    @bracket = Bracket.new
    @players = Player.all
  end

  def create
    @players = params[:game_players]
    array = @players.map { |k,v| k }
    # @array.shuffle!
    @bracket = Bracket.new(bracket_params)
    @bracket.save
    
 
    
    @game = Game.create(bracket: @bracket)
    
      GamePlayer.create(bracket: @bracket, player_id: array[0], game: @game)
      GamePlayer.create(bracket: @bracket, player_id: array[1], game: @game)

    @game = Game.create(bracket: @bracket)

      GamePlayer.create(bracket: @bracket, player_id: array[2], game: @game)
      GamePlayer.create(bracket: @bracket, player_id: array[3], game: @game)

      redirect_to brackets_path, flash: {notice: "Bracket '#{@bracket.name}' was created."}
  end

  def destroy
    Bracket.find(params[:id]).destroy
    
    redirect_to brackets_path, flash: {notice: "Bracket was deleted."}
  end

  private

  def bracket_params
    params.require(:bracket).permit(:name, game_players_attributes: [:id, :name])
  end
end
