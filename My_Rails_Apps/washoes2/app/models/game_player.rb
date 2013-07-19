class GamePlayer < ActiveRecord::Base
  has_many :points
  belongs_to :game
  belongs_to :player

  validates :game_id, uniqueness: true

  accepts_nested_attributes_for :points

  def total
    if self.points.length < 2
      0
    else
      # self.points.map {|point| point['score']}.reduce(0, :+)
      total_array = []

      self.points.each do |point|
        if point['score']
          total_array << point['score']
        end
      end

      total = total_array.reduce(0, :+)

      if total > 63
        total
      elsif total > 42
        total - 42
      elsif total > 21
        total - 21
      else
        total
      end

    end
  end

end
