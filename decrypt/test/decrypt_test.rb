gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/decrypt'
require_relative '../lib/key_combiner'

class DecryptTest < Minitest::Test

  def test_it_has_a_class
    assert Decrypt
  end

  def test_it_can_access_first_char_of_reversed_character_map
    secret = Decrypt.new("t", "12012")
    assert_equal ",", secret.reversed_character_map[0]
  end

  def test_it_can_pull_complete_key
    key = Key.new("12012", "140915").complete_key
    secret = Decrypt.new("t", key)
    assert_equal ["19", "22", "3", "17"], secret.complete_key
  end

  def test_it_can_decrypt_one_letter
    key = Key.new("12012", "140915").complete_key
    secret = Decrypt.new("t", key)
    assert_equal "a", secret.decrypt_message
  end

  def test_it_can_decrypt_two_letters
    key = Key.new("12012", "140915").complete_key
    secret = Decrypt.new("to", key)
    assert_equal "a5", secret.decrypt_message
  end

  def test_it_can_decrypt_word
    key = Key.new("12012", "140915").complete_key
    secret = Decrypt.new("80d8", key)
    assert_equal "pear", secret.decrypt_message
  end

  def test_it_can_decrypt_not_multiple_of_4
    key = Key.new("12012", "140915").complete_key
    secret = Decrypt.new("t8ev ", key)
    assert_equal "amber", secret.decrypt_message
  end

  def test_it_can_handle_capital_letters
    key = Key.new("12012", "140915").complete_key
    secret = Decrypt.new("T8eV ", key)
    assert_equal "amber", secret.decrypt_message
  end

  def test_another_decrypt
    key = Key.new("40738", "140915").complete_key
    secret = Decrypt.new("mw,v6yqbghbrlh8" , key)
    assert_equal "encrypt ..end..", secret.decrypt_message
  end


end
