require 'minitest/autorun'
require_relative 'euler58'

class Euler58Test < Minitest::Test
	
	def test_num_diagonals
		assert_equal 1, num_diagonals(1)
		assert_equal 5, num_diagonals(3)
		assert_equal 9, num_diagonals(5)
		assert_equal 13, num_diagonals(7)
	end

end
