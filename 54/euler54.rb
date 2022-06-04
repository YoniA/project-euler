
RANKS = %w{ 2 3 4 5 6 7 8 9 T J Q K A }
SUITS = %w{ D S C H }

class Hand
	include Comparable
	attr_reader :hand

	def initialize(hand)
		raise "illegal hand: #{hand}" unless Hand.legal_hand?(hand)
		@hand = hand
	end	

	def self.legal_hand?(hand)
		return false if hand.size != 5
		return false if hand.uniq.size != hand.size
		
		ranks = hand.map {|card| card[0]}
		suits = hand.map {|card| card[1]}
		return false unless (ranks - RANKS).empty?
		return false unless (suits - SUITS).empty?

		return true
	end

	def <=>(other)
		results1 = [royal_flush(hand), straight_flush(hand), four_of_a_kind(hand), full_house(hand), \
									flush(hand), straight(hand), three_of_a_kind(hand), two_pairs(hand), one_pair(hand)]
		results2 = [royal_flush(other.hand), straight_flush(other.hand), four_of_a_kind(other.hand), full_house(other.hand), \
									 flush(other.hand), straight(other.hand), three_of_a_kind(other.hand), two_pairs(other.hand), one_pair(other.hand)]

		rank1 = results1.find {|r| r!= false}
		rank2 = results2.find {|r| r!= false}
	
		if (results1.index(rank1) == nil) && (results2.index(rank2) == nil)
			return  RANKS.index(high_card(hand)) <=> RANKS.index(high_card(other.hand)) 
		elsif results1.index(rank1) == results2.index(rank2)
			if (RANKS.index(rank1) <=> RANKS.index(rank2)) != 0
				return RANKS.index(rank1) <=> RANKS.index(rank2)
			else
				return RANKS.index(high_card(hand)) <=> RANKS.index(high_card(other.hand))
			end 
		elsif (results1.index(rank1) != nil) && (results2.index(rank2) == nil)
			return 1
		elsif (results2.index(rank2) != nil) && (results1.index(rank1) == nil)
			return -1
		else
			return (results1.index(rank1) <=> results2.index(rank2)) * -1
		end
	end
end

class Poker
	attr_reader :winner
	def initialize(game)
		@hand1 = Hand.new(game.first(5))
		@hand2 = Hand.new(game.last(5))

	@winner = @hand1 <=> @hand2
	end
end

def high_card(hand)
	ranks = hand.map {|card| card[0]}
	i = ranks.map {|rank| RANKS.index(rank)}.max
	RANKS[i]
end


def one_pair(hand)
	ranks = hand.map {|card| card[0]}
	h = {}
	ranks.each {|rank| h[rank] ||= ranks.count(rank)}
	result = false
	h.keys.sort.each do |k|
		result = k if h[k] == 2
	end
	result
end


def two_pairs(hand)
	ranks = hand.map {|card| card[0]}
	h = {}
	ranks.each {|rank| h[rank] ||= ranks.count(rank)}
	result = false
	if h.values.filter {|v| v == 2}.size >= 2
	  h.keys.sort.each do |k|
			result = k if h[k] == 2
		end
	end
	result
end


def three_of_a_kind(hand)
	hand.sort!
	values = hand.map {|card| card[0]}
	result = false
	result = values[2] if values[0..2].uniq.size == 1 
	result = values[3] if values[1..3].uniq.size == 1 
	result = values[4] if values[2..4].uniq.size == 1
	result
end


def straight(hand)
	arr = hand.map {|card| card[0]}.map {|rank| RANKS.index(rank)}
	arr.sort!
	is_straight = (arr[1] - arr[0] == 1) && (arr[2] - arr[1] == 1) && (arr[3] - arr[2] == 1) && (arr[4] - arr[3] == 1)   
	return is_straight ? arr[-1] : false
	
end


def flush(hand)
	is_flush = hand.map {|card| card[1]}.uniq.size == 1
	return is_flush ? high_card(hand) : false
end


def full_house(hand)
	is_full_house = three_of_a_kind(hand) && one_pair(hand)
	return is_full_house ? three_of_a_kind(hand) : false
end


def four_of_a_kind(hand)
	hand.sort!
	values = hand.map {|card| card[0]}
	result = false
	return values[0] if values[0..3].uniq.size == 1
	return values[1] if values[1..4].uniq.size == 1 
	return false
end


def straight_flush(hand)
	is_sf = straight(hand) && flush(hand)
	return is_sf ? straight(hand) : false
end


def royal_flush(hand)
	is_rf = (hand.map {|card| card[0]}.sort == %w{ T J Q K A }.sort) && flush(hand)
	return is_rf ? "A" : false
end


wins1 = 0

File.readlines("p054_poker.txt").each do |game|
	poker_game = Poker.new(game.split)
	wins1 += 1 if poker_game.winner == 1	
end


puts wins1
