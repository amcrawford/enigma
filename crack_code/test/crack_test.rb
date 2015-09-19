require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/crack'
require_relative '../../decrypt/lib/decrypt'

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

  def test_it_can_decrypt_with_an_opperational_key
    message_with_unknown_key = Crack.new("t8ev tpv.bdxxtbpx9gpr", "140915")
    assert_equal "amber message ..end..", message_with_unknown_key.decrypt_file
  end

end
