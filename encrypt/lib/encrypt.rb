require_relative 'key'

class Encrypt

  attr_reader :character_map, :start_key

  def initialize(plain)
    @character_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    @start_key = Key.new
    @plain = plain
  end

  def complete_key
    @complete_key = @start_key.complete_key
  end

  def split_plain_text
    @plain.downcase.chars.each_slice(4).to_a
  end

  def encrypt_message
    complete_key
    chunks_of_four = split_plain_text
    encrypted_text = ""
    chunks_of_four.each do |chunk|
      encrypted_text << encrypt_chars(chunk)
    end
    encrypted_text
  end

  def encrypt_chars(chunk)
    encrypted_message = ""
    chunk.each_with_index do |char, index|
      if !@character_map.include?(char)
        encrypted_message << char
      else
        current_map = rotate_map(char, index)
        encrypted_character = current_map[0]
        encrypted_message << encrypted_character
      end
    end
    encrypted_message
  end

  def rotate_map(char, index)
    current_map = @character_map
    loop do
      current_map = current_map.rotate
      break if current_map[0] == char
    end
    current_map.rotate!(@complete_key[index].to_i)
  end

end
