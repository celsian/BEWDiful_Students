class Shirt < ActiveRecord::Base
  validates :name, :color, :description, :presence => { :message => " is required." }

  def to_s
    "#{name} | #{description} | #{color}"
  end
end
