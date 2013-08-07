class Drink < ActiveRecord::Base
  validates :name, :price, :description, presence: true
  

  def formatted_price
    "$%.2f" % price
  end


end
