gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/decrypt'

class DecryptTest < Minitest::Test

  def test_it_has_a_class
    assert Decrypt
  end

  def test_it_can_access_first_char_of_reversed_character_map
    secret = Decrypt.new("t", "12012", "140915")
    assert_equal ",", secret.reversed_character_map[0]
  end

  def test_it_can_pull_complete_key
    secret = Decrypt.new("t", "12012", "140915")
    assert_equal ["19", "22", "3", "17"], secret.complete_key
  end

  def test_it_can_decrypt_one_letter
    secret = Decrypt.new("t", "12012", "140915")
    assert_equal "a", secret.decrypt_message
  end

  def test_it_can_decrypt_two_letters
    secret = Decrypt.new("to", "12012", "140915")
    assert_equal "a5", secret.decrypt_message
  end

  def test_it_can_decrypt_word
    secret = Decrypt.new("80d8", "12012", "140915")
    assert_equal "pear", secret.decrypt_message
  end

  def test_it_can_decrypt_not_multiple_of_4
    secret = Decrypt.new("t8ev ", "12012", "140915")
    assert_equal "amber", secret.decrypt_message
  end

  def test_it_can_handle_capital_letters
    secret = Decrypt.new("T8eV " , "12012", "140915")
    assert_equal "amber", secret.decrypt_message
  end

end
