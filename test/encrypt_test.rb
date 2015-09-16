require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt'

class EncryptTest < Minitest::Test
  def test_it_has_a_class
    assert Encrypt
  end

  def test_it_can_access_first_char_of_character_map
    secret_message = Encrypt.new("a")
    assert_equal "a", secret_message.character_map[0]
  end

  def test_it_can_access_last_char_of_character_map
    secret_message = Encrypt.new("a")
    assert_equal ",", secret_message.character_map[38]
  end

  def test_it_can_pull_key
    secret_message = Encrypt.new("a")
    secret_message.start_key.key = "12345"
    secret_message.start_key.date = "140915"
    assert_equal ["19", "25", "36", "50"], secret_message.complete_key
  end

  def test_it_can_split_into_four_character_chunks
    secret_message = Encrypt.new("abcd")
    expected = secret_message.split_plain_text
    assert_equal [["a", "b", "c", "d"]], expected
  end










  def test_it_can_handle_less_than_4_chars
    skip
    secret_message = Encrypt.new("a")
    assert_equal "t", secret_message.encrypt
  end





#   Four characters are encrypted at a time.
# The first character is rotated forward by the "A" rotation plus the "A offset"
# The second character is rotated forward by the "B" rotation plus the "B offset"
# The third character is rotated forward by the "C" rotation plus the "C offset"
# The fourth character is rotated forward by the "D" rotation plus the "D offset"

end
