class Peanut < ActiveRecord::Base
  validates :calories, presence: true
end
