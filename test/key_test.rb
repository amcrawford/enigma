gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/key'

class KeyTest < MiniTest::Test
  def test_it_can_generate_random_key_5_digits_long
    key1 = Key.new
    assert_equal 5, key1.key.length
  end

  def test_keys_for_different_instances_are_not_equal
    key1 = Key.new
    key2 = Key.new
    key3 = Key.new
    refute key1.key == key2.key
    refute key2.key == key3.key
  end

  def test_it_can_pull_todays_date
    # reset to be an actual string
    key1 = Key.new
    assert_equal Time.now.strftime("%d%m%y"), key1.date
  end

  def test_that_we_can_pull_ABCD_positions
    key1 = Key.new
    key1.key = "12345"
    key1.random_abcd_positions
    assert_equal "12", key1.a_position
    assert_equal "23", key1.b_position
    assert_equal "34", key1.c_position
    assert_equal "45", key1.d_position
  end

  def test_that_we_can_calculate_complete_key_for_position_a
    key1 = Key.new
    key1.key = "12345"
    key1.date = "140915"
    assert_equal "140915", key1.date
    key1.complete_key
    assert_equal "19", key1.a_position
  end

  def test_that_it_can_calculate_a_full_complete_key
    key1 = Key.new
    key1.key = "12345"
    key1.date = "140915"
    key1.complete_key
    assert_equal "19", key1.a_position
    assert_equal "25", key1.b_position
    assert_equal "36", key1.c_position
    assert_equal "50", key1.d_position
  end

end
