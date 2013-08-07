class Player < ActiveRecord::Base
  has_many :game_players
  has_many :games, through: :game_players
  has_many :brackets, through: :game_players

  validates :name, :presence => { :message => " is required." }
  validates :name, :uniqueness => :true
  
  def wins
    Game.where(winner: self).length
  end

  def bracket_wins
    Bracket.where(winner: self).length
  end

  def bracket_points(bracket)
    points = []
    self.game_players.each do |game_player|
      if game_player.bracket == bracket
        points << game_player.total_points
      end
    end
    total = points.reduce(0, :+)
    return total
  end

  def lifetime_points
    points = []
    self.game_players.each do |game_player|
      points << game_player.total_points
    end
    total = points.reduce(0, :+)
    return total
  end

end
