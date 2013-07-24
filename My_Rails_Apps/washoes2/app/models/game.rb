class Game < ActiveRecord::Base
  has_many :game_players
  has_many :players, through: :game_players
  belongs_to :winner, class_name: "Player"
  belongs_to :bracket

  accepts_nested_attributes_for :game_players

  # validate :unique_players

  # def unique_players
  #   if GamePlayer.errors.any?
  #     errors.add(:players, "must be unique.")
  #   end
  # end

  def set_winner(player)
    self.winner = player
    if self.save
      return true
    else
      return false
    end
  end

end
