class Point < ActiveRecord::Base
  belongs_to :player

  serialize :score
end
