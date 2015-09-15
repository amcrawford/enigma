require_relative 'key'

class Encrypt

  attr_reader :character_map, :start_key
  #have a character map

  def initialize(plain)
    @character_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    @start_key = Key.new
    @plain = plain
  end
  #have access to the key from KeyClass

  def complete_key
    @complete_key = @start_key.complete_key
  end

  def split_plain_text
    chunks_of_four = @plain.downcase.chars.each_slice(4).to_a
    # split string into array of characters
    # break that text into four letter chunks
    # downcase
  end

  def encrypt
    # complete key
    #for each letter in the chunk it needs to find it's match in the char map
    #and then at the same index in the key, rotate through the char map by the rotations at the same index
  end


end

# secret_message = Encrypt.new("a")
# p secret_message.key
