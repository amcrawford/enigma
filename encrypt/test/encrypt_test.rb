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

  def test_it_can_encrypt
    secret_message = Encrypt.new("pear")
    secret_message.start_key.key = "12012"
    secret_message.start_key.date = "140915"
    encrypted_message = secret_message.encrypt_message
    assert_equal "80d8", encrypted_message
  end

  def test_it_can_encrypt_message_that_is_not_multiples_of_four
    secret_message = Encrypt.new("amber")
    secret_message.start_key.key = "12012"
    secret_message.start_key.date = "140915"
    encrypted_message = secret_message.encrypt_message
    assert_equal "t8ev ", encrypted_message
  end

  def test_it_can_handle_uppercase_letters
    secret_message = Encrypt.new("Amber")
    secret_message.start_key.key = "12012"
    secret_message.start_key.date = "140915"
    encrypted_message = secret_message.encrypt_message
    assert_equal "t8ev ", encrypted_message
  end

  def test_it_can_handle_letters_outside_char_map
    secret_message = Encrypt.new("Amber!")
    secret_message.start_key.key = "12012"
    secret_message.start_key.date = "140915"
    encrypted_message = secret_message.encrypt_message
    assert_equal "t8ev !", encrypted_message
  end

  def test_it_can_encrypt_more
    secret_message = Encrypt.new("..end..")
    secret_message.start_key.key = "34190"
    secret_message.start_key.date = "140915"
    encrypted_message = secret_message.encrypt_message
    assert_equal "acz4fct", encrypted_message
  end

  def test_it_can_encrypt_more_again
    secret_message = Encrypt.new("encrypt ..end..")
    secret_message.start_key.key = "71293"
    secret_message.start_key.date = "140915"
    encrypted_message = secret_message.encrypt_message
    assert_equal "e17.y3lr.m97dm3", encrypted_message
  end

  def test_it_can_encrypt_more_again_additionally
    secret_message = Encrypt.new("encrypt ..end..")
    secret_message.start_key.key = "40738"
    secret_message.start_key.date = "140915"
    encrypted_message = secret_message.encrypt_message
    assert_equal "mw,v6yqbghbrlh8", encrypted_message
  end

end
