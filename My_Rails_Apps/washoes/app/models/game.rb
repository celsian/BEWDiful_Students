class Game < ActiveRecord::Base
  has_and_belongs_to_many :players
  has_many :points, :through => :players
  belongs_to :winner, class_name: "Player"
  belongs_to :bracket
  
  def set_winner
    @player = Player.find(params[:player])
    @game = Game.find(params[:game])
    @game.winner = @player
    @game.save
    redirect_to games_path
  end

  def add_points(players)
    players.each do |player|
      player.points << Point.create(game_id: self.id)
    end
  end
  
end
