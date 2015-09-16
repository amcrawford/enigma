require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt'

class EncryptTest < Minitest::Test
  def test_it_has_a_class
    assert Encrypt
  end

  def test_that_it_initializes_with_complete_key
    secret_message = Encrypt.new
    complete_key = secret_message.start_key.complete_key("140915", "12345")
    assert_equal ["19", "25", "36", "50"], complete_key
  end

  def test_it_can_encrypt_one_letter
    secret_message = Encrypt.new
    complete_key = secret_message.start_key.complete_key("140915", "12012")
    encrypted_message = secret_message.encrypt("p", complete_key)
    assert_equal "8", encrypted_message
  end

  def test_it_can_encrypt_two_letters
    secret_message = Encrypt.new
    complete_key = secret_message.start_key.complete_key("140915", "12012")
    encrypted_message = secret_message.encrypt("pe", complete_key)
    assert_equal "80", encrypted_message
  end

  def test_it_can_encrypt_four_letters
    secret_message = Encrypt.new
    complete_key = secret_message.start_key.complete_key("140915", "12012")
    encrypted_message = secret_message.encrypt("pear", complete_key)
    assert_equal "80d8", encrypted_message
  end

  def test_it_can_handle_upcase
    secret_message = Encrypt.new
    complete_key = secret_message.start_key.complete_key("140915", "12012")
    encrypted_message = secret_message.encrypt("peAR", complete_key)
    assert_equal "80d8", encrypted_message
  end

  def test_it_can_handle_string_length_that_is_not_factor_of_four
    secret_message = Encrypt.new
    expected = secret_message.split_plain_text("Amber")
    assert_equal [["a", "m", "b", "e"], ["r"]], expected
  end

  def test_it_can_encrypt_long_word
    secret_message = Encrypt.new
    complete_key = secret_message.start_key.complete_key("140915", "12012")
    encrypted_message = secret_message.encrypt("Amber", complete_key)
    assert_equal "t8ev ", encrypted_message
  end

end
