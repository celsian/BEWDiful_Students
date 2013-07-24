class Bracket < ActiveRecord::Base
  has_many :game_players, dependent: :destroy
  has_many :players, through: :game_players
  has_many :games

  belongs_to :winner, class_name: "Player"

  validates :name, :presence => { :message => " is required." }
  validates :name, :uniqueness => :true

end
