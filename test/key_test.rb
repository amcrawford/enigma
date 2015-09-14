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

end
