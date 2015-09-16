gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/key_combiner'

class KeyTest < MiniTest::Test
  def test_that_we_can_calculate_complete_key_for_position_a
    key1 = Key.new("82648", "030415")
    key1.complete_key
    assert_equal "84", key1.complete_key[0]
  end

  def test_that_we_can_calculate_complete_key_for_all_positions
    key1 = Key.new("82648", "030415")
    key1.complete_key
    assert_equal ["84", "28", "66", "53"], key1.complete_key
  end
end
