class Player < ActiveRecord::Base
  has_and_belongs_to_many :games
  has_many :points

  validates :name, :presence => { :message => " is required." }

end
