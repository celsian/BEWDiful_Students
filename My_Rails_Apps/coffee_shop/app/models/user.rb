class User < ActiveRecord::Base
  has_many :user_drinks

  def buy_drink(drink)
    if balance > drink.price
      self.balance -= drink.price
      self.save!

      user_drinks << UserDrink.new(drink: drink)
    end
  end
end
