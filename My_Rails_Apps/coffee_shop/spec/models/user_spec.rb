require 'spec_helper'

describe User do
  describe "#buy_drink" do
    subject { FactoryGirl.create(:user) }
    let(:drink) { FactoryGirl.create(:drink) } #let(:drink) is the same as drink

    it 'deducts the drinks price from the users balance' do
      # subject.buy_drink(drink)
      # expect(subject.balance).to eq(95.00)

      #better version of the above.
      expect { subject.buy_drink(drink) }.to change(subject, :balance).from(100).to(95)
    end

    it 'fails if the user does not have enough money' do
      subject.balance = 4
      # subject.buy_drink(drink)
      # expect(subject.balance).to eq(4)

      #better version of the above.
      expect { subject.buy_drink(drink) }.to_not change(subject, :balance)
    end

    it 'saves the deducted balance' do 
      subject.buy_drink(drink)

      expect(subject.reload.balance).to eq(95)

    end

    it 'creates a UserDrink for the right drink' do
      subject.buy_drink(drink)
      # expect(subject.user_drinks.count).to eq(1)
      # expect(subject).to have(1).user_drinks
      user_drink = subject.user_drinks.last
      expect(user_drink.drink).to eq(drink)
    end
  end
end
