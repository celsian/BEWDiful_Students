class Game < ActiveRecord::Base
  has_and_belongs_to_many :players
  has_and_belongs_to_many :winners, class_name: "Player"
  belongs_to :bracket
  
end
