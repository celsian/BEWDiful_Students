class Point < ActiveRecord::Base
  belongs_to :player
  belongs_to :game

  serialize :score

  def by_game(game)
    scoped(:conditions => { :game_id => game.id })
  end

  def total
    if self.score
      sum = self.score.sum
      if sum > 63
        sum
      elsif sum > 42
        sum - 42
      elsif sum > 21
        sum - 21
      else
        sum
      end
    else
      self.score = []
      0
    end
  end

end
