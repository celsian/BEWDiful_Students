class BlackjackController < ApplicationController

  def index
    @bank = 1000
    @bet = 5
  end

  def play
    @play_deck = Deck.new

    @user_hand = []
    @dealer_hand = []

    deal
    @user_total = total @user_hand
    @dealer_total = total @dealer_hand
  end

  def hit
    hit_hand @user_hand
  end

  def deal
    @user_hand << @play_deck.cards.sample#.shift
    @dealer_hand << @play_deck.cards.sample#.shift
    @user_hand << @play_deck.cards.sample#.shift
    @dealer_hand << @play_deck.cards.sample#.shift
  end

  def hit_hand hand
    hand << @play_deck.cards.sample#shift
  end

  def total array_hand
    value_array = []
    retvalue = 0

    array_hand.each do |x| #Goes through each card in the hand and adds its value to the total
      value_array << Card.value(x.value) #Takes the value of X card object, then uses the self.value method to eval the fixnum value
    end
    value_array.sort!

    value_array.each do |x|
      if retvalue + x > 21 && x == 11
        retvalue += 1
      else
        retvalue += x
      end
    end

    retvalue
  end
end

  class Card
    #Hashes for Values and Suits
    @@values = {"A" => 11, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "J" => 10, "Q" => 10, "K" => 10}
    @@suits = {"S" => "Spades", "H" => "Hearts", "C" => "Clubs", "D" => "Diamonds"}

    def initialize(value, suit) #For initializing a card object
      @value = value
      @suit = suit
    end

    def self.value value #For getting the fixnum from the @@values hash
      @@values[value]
    end

    def self.suit suit #For getting the Long Suit from the @@suits hash
      @@suits[suit]
    end

    def self.values #For returning the @@values hash
      @@values
    end

    def self.suits #For returning the @@suits hash
      @@suits
    end

    def value #For returning a card objects value
      @value
    end

    def suit #For returning a card objects suit
      @suit
    end

    def to_s #For printing cards prettily.
      "#{@value} of #{@@suits[@suit]}'s"
    end
  end


  class Deck
    def initialize
      @deck = []
      values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
      suits = ["S", "H", "C", "D"]
      suits.each do |s|
        values.each do |v|
          @deck << Card.new(v, s)
        end
      end
    end

    def size
      @deck.length
    end

    def cards
      @deck
    end
  end