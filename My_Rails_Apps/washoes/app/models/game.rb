class Game < ActiveRecord::Base
  has_and_belongs_to_many :players
  has_one :winner, class_name: "Player"
  belongs_to :bracket
  
end