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

end
