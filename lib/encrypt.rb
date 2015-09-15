require_relative 'key'

class Encrypt
CHARACTER_MAP = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
  attr_reader :character_map, :start_key
  #have a character map

  def initialize
    @start_key = Key.complete_key
  end

  def split_plain_text(plain_text)
    plain_text.downcase.chars.each_slice(4).to_a
  end

  def encrypt(plain_text)
    encrypted_text = ""
    chunks_of_four = split_plain_text(plain_text)
    chunks_of_four.each do |chunk|
      encrypted_text = rotate(chunk).join
    end
    encrypted_text
  end

  def rotate(chunk, key = @start_key)
    encrypted_message = ""
      array.each_with_index do |char, index|
          current_map = CHARACTER_MAP
          loop do
            current_map = current_map.rotate
            break if current_map[0] == char
          end
          current_map = current_map.rotate(key[index].to_i)
          encrypted_character = current_map[0]
          encrypted_message << encrypted_character
        end
      end
      encrypted_message
      end
    end
    #and then at the same index in the key, rotate through the char map by the rotations at the same index
  end


end

# secret_message = Encrypt.new("a")
# p secret_message.key
