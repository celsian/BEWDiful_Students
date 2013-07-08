class Player < ActiveRecord::Base
  validates :name, :presence => { :message => " is required." }
end
