class Player < ActiveRecord::Base
  has_many :game_players
  has_many :games, through: :game_players

  validates :name, :presence => { :message => " is required." }
  
  def wins
    Game.where(winner: self).length
  end
  
end
