gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/key'

class KeyTest < MiniTest::Test
  def test_it_can_generate_random_key_5_digits_long
    key1 = Key.new
    assert_equal 5, key1.generate_random_key.length
  end

  def test_keys_for_different_instances_are_not_equal
    key1 = Key.new
    key2 = Key.new
    key3 = Key.new
    refute key1.generate_random_key == key2.generate_random_key
    refute key2.generate_random_key == key3.generate_random_key
  end

  def test_that_we_can_calculate_complete_key_for_position_a
    key1 = Key.new
    result = key1.complete_key("140915", "12345")
    assert_equal "19", result[0]
  end

  def test_that_it_can_calculate_a_full_complete_key
    key1 = Key.new
    result = key1.complete_key("140915", "12345")
    assert_equal ["19", "25", "36", "50"], result
  end

end
