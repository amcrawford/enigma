require_relative 'key_combiner'

class Decrypt

  attr_accessor :reversed_character_map, :complete_key

  def initialize(encrypted_text, complete_key)
    @complete_key = complete_key
    @reversed_character_map = [",", ".", " ", "9", "8", "7", "6", "5", "4", "3", "2", "1", "0", "z", "y", "x", "w", "v", "u", "t", "s", "r", "q", "p", "o", "n", "m", "l", "k", "j", "i", "h", "g", "f", "e", "d", "c", "b", "a"]
    @encrypted_text = encrypted_text
  end

  def split_encrypted_text
    @encrypted_text.downcase.chars.each_slice(4).to_a
  end

  def decrypt_message
    chunks_of_four = split_encrypted_text
    decrypted_text = ""
    chunks_of_four.each do |chunk|
      decrypted_text << decrypt_chars(chunk)
    end
    decrypted_text
  end

  def decrypt_chars(chunk)
    decrypted_message = ""
    chunk.each_with_index do |char, index|
      if !@reversed_character_map.include?(char)
        decrypted_message << char
      else
        current_map = rotate_map(char, index)
        decrypted_character = current_map[0]
        decrypted_message << decrypted_character
      end
    end
    decrypted_message
  end

  def rotate_map(char, index)
    current_map = @reversed_character_map
    loop do
      current_map = current_map.rotate
      break if current_map[0] == char
    end
    current_map.rotate!(@complete_key[index].to_i)
  end

end
