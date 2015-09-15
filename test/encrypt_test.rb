require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt'

class EncryptTest < Minitest::Test
  def test_it_has_a_class
    assert Encrypt
  end

  def test_it_can_handle_less_than_4_chars
    skip
  end

  def test_it_can_break_text_into_4_char_chuncks
    skip
  end



#   Four characters are encrypted at a time.
# The first character is rotated forward by the "A" rotation plus the "A offset"
# The second character is rotated forward by the "B" rotation plus the "B offset"
# The third character is rotated forward by the "C" rotation plus the "C offset"
# The fourth character is rotated forward by the "D" rotation plus the "D offset"

end
