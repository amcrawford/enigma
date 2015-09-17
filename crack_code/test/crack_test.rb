require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/crack'

class CrackTest < Minitest::Test

  def test_that_it_can_find_remainder
    message_with_unknown_key = Crack.new("pizza", "140915")
    result = message_with_unknown_key.found_remainder
    assert_equal 1, result
  end

  def test_set_messages_by_remainder_works
    message_with_unknown_key = Crack.new("t8ev tpv.bdxxtbpx9gpr", "140915")
    result = message_with_unknown_key.set_messages_by_remainder
    assert_equal [["x", "e"], ["9", "n"], ["g", "d"], ["p", "."]], result
  end

  def test_it_can_find_complete_key
    message_with_unknown_key = Crack.new("t8ev tpv.bdxxtbpx9gpr", "140915")
    result = message_with_unknown_key.crack
    assert_equal ["19", "22", "3", "17"], result
  end

  def test_it_can_find_middle_key
    message_with_unknown_key = Crack.new("t8ev tpv.bdxxtbpx9gpr", "140915")
    middle_key = message_with_unknown_key.crack
    middle_key = message_with_unknown_key.middle_key
    assert_equal "12200112", middle_key
  end

  def test_that_it_can_crack_key
    message_with_unknown_key = Crack.new("t8ev tpv.bdxxtbpx9gpr", "140915")
    middle_key = message_with_unknown_key.crack
    middle_key = message_with_unknown_key.calculate_key
    assert_equal "12012", middle_key
  end

end
