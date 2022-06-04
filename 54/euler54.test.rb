require 'minitest/autorun'
require_relative 'euler54'

class PokerTest < Minitest::Test

	def test_legal_hand
		hand = %w{ 3D 4D 5D 6D 7D }
		assert_equal true, Hand.legal_hand?(hand) 

		hand = %w{ 3D TS 5H QD 7D }
		assert_equal true, Hand.legal_hand?(hand) 

		hand = %w{ 3D 4D 5D 6D 7D, 8F }
		assert_equal false, Hand.legal_hand?(hand) 

		hand = %w{ 3D 4D 5D }
		assert_equal false, Hand.legal_hand?(hand) 

		hand = %w{ 3D 3D 5D 6D 7D }
		assert_equal false, Hand.legal_hand?(hand) 

		hand = %w{ 3d 4d 5d 6d 7d }
		assert_equal false, Hand.legal_hand?(hand) 
	end


	def test_high_card
		hand = %w{ 3C 9S 3D KS 9D }
		assert_equal "K", high_card(hand)
		hand = %w{ AC 9S 3D KS 9D }
		assert_equal "A", high_card(hand)

		hand = %w{ TC TH 3D 8S 9D }
		assert_equal "T", high_card(hand)

		hand = %w{ TC TH JD QS 8D }
		assert_equal "Q", high_card(hand)
	end


	def test_one_pair
		hand = %w{ 3C 9S 3D KS 9D }
		assert_equal true, one_pair(hand) == false ? false :true

		hand = %w{ 3C 9S 3D KS 3H }
		assert_equal false, one_pair(hand) == false ? false :true

		hand = %w{ 3D TS 5H QD 7D }
		assert_equal false, one_pair(hand) == false ? false :true
	end


	def test_two_pairs
		hand = %w{ 3C 9S 3D KS 9D }
		assert_equal true, two_pairs(hand) == false ? false :true

		hand = %w{ 3C 9S 3D 3H 9D }
		assert_equal true, two_pairs(hand) == false ? false :true

		hand = %w{ KH 9D TC JH QH }
		assert_equal false, two_pairs(hand) == false ? false :true
	end

	
	def test_three_of_a_kind
		hand = %w{ 3C 9S 3D 3S 9D }
		assert_equal true, three_of_a_kind(hand) == false ? false :true

		hand = %w{ JD JH 5D 6D 7D }
		assert_equal false, three_of_a_kind(hand) == false ? false :true
	end


	def test_straight
		hand = %w{ KH 9D TC JH QH }
		assert_equal true, straight(hand) == false ? false :true

		hand = %w{ AH 9D TC JH QH }
		assert_equal false, straight(hand) == false ? false :true

		hand = %w{ 3D 4D 5D 6D 7D }
		assert_equal true, straight(hand) == false ? false :true

		hand = %w{ 5D 6D 7D 3S 4S }
		assert_equal true, straight(hand) == false ? false :true
	end


	def test_flush
		hand = %w{ 3D 4D 5D 6D 7D }
		assert_equal true, flush(hand) == false ? false :true
		
		hand = %w{ 7D 6D 5D 4D 2D 3D }
		assert_equal true, flush(hand) == false ? false :true

		hand = %w{ 3D 4D 5D 6D 7S }
		assert_equal false, flush(hand) == false ? false :true
 
		hand = %w{ 3D 3S 3H 3C 4S }
		assert_equal false, flush(hand) == false ? false :true
	end


	def test_full_house
		hand = %w{ 3C 3D 3S 9S 9D }
		assert_equal true, full_house(hand) == false ? false :true

		hand = %w{ 3C 9S 3D 3S 9D }
		assert_equal true, full_house(hand) == false ? false :true

		hand = %w{ 3C 3D 3S 3H 9D }
		assert_equal false, full_house(hand) == false ? false :true
	end


	def test_four_of_a_kind
		hand = %w{ 3C 9S 3D 3S 3H }
		assert_equal true, four_of_a_kind(hand) == false ? false :true

		hand = %w{ 3C 9S 3D 3S 9D }
		assert_equal false, four_of_a_kind(hand) == false ? false :true

		hand = %w{ TC 9S TD TS TH }
		assert_equal true, four_of_a_kind(hand) == false ? false :true
	end


	def test_straight_flush
		hand = %w{ 7D 6D 5D 4D 3D }
		assert_equal true, straight_flush(hand) == false ? false :true

		hand = %w{ KH 9H TH JH QH }
		assert_equal true, straight_flush(hand) == false ? false :true

		hand = %w{ AH 9D TC JH QH }
		assert_equal false, straight_flush(hand) == false ? false :true
	end


  def test_royal_flush
		hand = %w{ KD AD TD QD JD }
    assert_equal true, royal_flush(hand) == false ? false :true

		hand = %w{ KD AD TS QD JD }
    assert_equal false, royal_flush(hand) == false ? false :true
		
		hand = %w{ 2S 3S 4S 5S 6S }
    assert_equal false, royal_flush(hand) == false ? false :true
  end

	
	def test_hand_comparator
		hand1 = Hand.new %w{ KD AD TD QD JD }
		hand2 = Hand.new %w{ 3C 9S 3D 3S 3H }
		assert_equal true, hand1 > hand2

		hand1 = Hand.new %w{ 3C 9S 3D 3S 3H }
		hand2 = Hand.new %w{ KD AD TD QD JD }
		assert_equal true, hand1 < hand2

		hand1 = Hand.new %w{ 5H 5C 6S 7S KD }
		hand2 = Hand.new %w{ 2C 3S 8S 8D TD }
		assert_equal true, hand1 < hand2
	end
end
