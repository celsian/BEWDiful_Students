class Game < ActiveRecord::Base
  has_and_belongs_to_many :players
  has_many :points
  belongs_to :winner, class_name: "Player"
  belongs_to :bracket

  accepts_nested_attributes_for :points

  def initialize_points(players)
    players.each do |player|
      player.points << Point.create(game: self)
    end
  end

end
