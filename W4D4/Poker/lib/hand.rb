require_relative 'card.rb'

class Hand

    attr_reader :hand, :player_name

    def initialize(player_name)
        @player_name = player_name
        @hand = []
    end

    def deal_hand
        5.times do 
        card = Card.new
         @hand << card.make_card unless @hand.include?(card)
        end
    end

end