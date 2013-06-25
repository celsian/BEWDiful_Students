class BlackjackController < ApplicationController

   before_filter :load_all
   after_filter :save_all

  def load_all #for saving values between sessions
    if session[:deck]
      @play_deck = Marshal.load(session[:deck]) 
    end
    if session[:user_hand]
      @user_hand = Marshal.load(session[:user_hand]) 
    end
    if session[:dealer_hand]
      @dealer_hand = Marshal.load(session[:dealer_hand]) 
    end
    if session[:bank]
      @bank = Marshal.load(session[:bank]) 
    end
    if session[:bet]
      @bet = Marshal.load(session[:bet]) 
    end
    if session[:userbet]
      @userbet = Marshal.load(session[:userbet]) 
    end
    if session[:game_over]
      @game_over = Marshal.load(session[:game_over]) 
    end
      @play_deck ||= Deck.new
      @play_deck.shuffle
      @user_hand ||= []
      @dealer_hand ||= []
      @bank ||= 0
      @bet ||= 0
      @userbet ||= 0
      @game_over ||= 0
  end

  def save_all #for saving values between sessions
    session[:deck] = Marshal.dump(@play_deck)
    session[:user_hand] = Marshal.dump(@user_hand)
    session[:dealer_hand] = Marshal.dump(@dealer_hand)
    session[:bank] = Marshal.dump(@bank)
    session[:bet] = Marshal.dump(@bet)
    session[:userbet] = Marshal.dump(@userbet)
    session[:game_over] = Marshal.dump(@game_over)
  end

  def index
    @bank = 1000.00
    @userbet = 5.00
    @bet = 5.00
    @play_deck = Deck.new
    @play_deck.shuffle
    @game_over = 0
  end

  def calcs state
    @user_total = total @user_hand
    @dealer_total = total @dealer_hand
    @results = game_over? state
  end

  def play
    @bet = @userbet
    if params[:act] == "hit"
      hit
    elsif params[:act] == "stay"
      stay
    elsif params[:act] == "double"
      double_down
    else
      player
    end
  end

  def player
    new_bet params[:new_bet]
    if !params[:new_bet]
      if @play_deck.size < 15
        @play_deck = Deck.new
        @play_deck.shuffle
      end
      
      if @bank <= 0
        clear_hands
        @results = "OUT OF MONEY LOSER!!!"
      else
        if @bank < @bet
          @userbet = @bank
          @bet = @bank
        end
        
        clear_hands
        
        bet
        deal
        calcs "deal"
      end
    end
  end

  def hit
    new_bet params[:new_bet]
    if !params[:new_bet] #Need this to avoid re-running calcs if it's a new_bet
      hit_hand @user_hand
      calcs "hit"
    end
  end

  def double_down
    new_bet params[:new_bet]
    if !params[:new_bet] #Need this to avoid re-running calcs if it's a new_bet
      @bank -= @bet
      @bet += @bet
      hit
      if @game_over == 0
        stay
      end
    end
  end

  def stay
    new_bet params[:new_bet]
    if !params[:new_bet] #Need this to avoid re-running calcs if it's a new_bet
      while (total @dealer_hand) < 17
        hit_hand @dealer_hand
      end
      calcs "stay"
    end
  end

  def new_bet pass_in
    if pass_in
      if pass_in[:new_bet].to_f >= 5 && pass_in[:new_bet].to_f <= 200
        @userbet = pass_in[:new_bet].to_f
        redirect_to bj_path
      else
        clear_hands
        @results = "Invalid Bet, Try again..."
      end
    end
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

  def clear_hands
    @user_hand = []
    @dealer_hand = []
  end

  def bet
    @bank -= @bet
  end

  def game_over? state
    if state == "deal"
      if @user_total == 21 && @dealer_total == 21
        @bank += @bet
        return result "tie"
      elsif @user_total == 21
        @bank += (@bet*2.5)
        return result "win"
      elsif @dealer_total == 21
        return result "lose"
      else
        @game_over = 0
      end
    end

    if state == "hit"
      if @user_total > 21
        return result "lose"
      else
        @game_over = 0
      end
    end

    if state == "stay"
      if @dealer_total > 21 || @user_total > @dealer_total
        @bank += (@bet*2)
        return result "win"
      elsif @dealer_total > @user_total
        return result "lose"
      elsif @dealer_total == @user_total
        @bank += @bet
        return result "tie"
      else
        @game_over = 0
      end
    end

    def result state
      @game_over = 1
      if state == "win"
        return "YOU WIN LOL!!"
      elsif state == "lose"
        return "YOU LOSE, EZ EZ"
      elsif state == "tie"
        return "OMG TIE UNPOSSIBBBBRUUUU!!!!!"
      end
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
    SUITS = {"S" => "♠", "H" => "♥", "C" => "♣", "D" => "♦"}

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
      "#{@value}#{SUITS[@suit]}"
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