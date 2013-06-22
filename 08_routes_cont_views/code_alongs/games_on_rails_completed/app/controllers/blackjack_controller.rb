class BlackjackController < ApplicationController

   before_filter :load_all
   after_filter :save_all

  def load_all
    if session[:deck]
      @play_deck = Marshal.load(session[:deck]) 
    end
    if session[:user_hand]
      @user_hand = Marshal.load(session[:user_hand]) 
    end
    if session[:dealer_hand]
      @dealer_hand = Marshal.load(session[:dealer_hand]) 
    end
      @play_deck ||= Deck.new
      @play_deck.shuffle
      @user_hand ||= []
      @dealer_hand ||= []
  end

  def save_all
    session[:deck] = Marshal.dump(@play_deck)
    session[:user_hand] = Marshal.dump(@user_hand)
    session[:dealer_hand] = Marshal.dump(@dealer_hand)
  end

  def index
    @bank = 1000
    @bet = 5
  end

  def calcs
    @user_total = total @user_hand
    @dealer_total = total @dealer_hand
    @result = game_over?
  end

  def play
    if @play_deck.size < 15
      @play_deck = Deck.new
      @play_deck.shuffle
    end

    @user_hand = []
    @dealer_hand = []

    deal
    calcs
  end

  def hit
    hit_hand @user_hand

    calcs
  end

  def deal
    @user_hand << @play_deck.cards.shift
    @dealer_hand << @play_deck.cards.shift
    @user_hand << @play_deck.cards.shift
    @dealer_hand << @play_deck.cards.shift
  end

  def hit_hand hand
    hand << @play_deck.cards.shift
  end

  def stay
    while (total @dealer_hand) < 17
      hit_hand @dealer_hand
    end

    calcs
  end

  def game_over?
    if @user_total < @dealer_total && @dealer_total <= 21
      "YOU LOSE, EZ EZ"
    elsif @user_total > @dealer_total || @dealer_total > 21
      "YOU WIN LOL!!"
    elsif @user_total == @dealer_total
      "OMG TIE UNPOSSIBBBBRUUUU!!!!!"
    end
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
    attr_reader :value, :suit
    #Hashes for Values and Suits
    VALUES = {"A" => 11, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "J" => 10, "Q" => 10, "K" => 10}
    SUITS = {"S" => "Spades", "H" => "Hearts", "C" => "Clubs", "D" => "Diamonds"}

    def initialize(value, suit) #For initializing a card object
      @value = value
      @suit = suit
    end

    def self.value value #For getting the fixnum from the VALUES hash
      VALUES[value]
    end

    def self.suit suit #For getting the Long Suit from the SUITS hash
      SUITS[suit]
    end

    def self.values #For returning the VALUES hash
      VALUES
    end

    def self.suits #For returning the SUITS hash
      SUITS
    end

    def to_s #For printing cards prettily.
      "#{@value} of #{SUITS[@suit]}'s"
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

    def shuffle
      @deck.shuffle!
      @deck.shuffle!
      @deck.shuffle!
    end

    def cards
      @deck
    end
  end