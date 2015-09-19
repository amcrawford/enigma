require_relative '../../decrypt/lib/decrypt'

class BruteForce
  attr_accessor :encrypted_message, :key

  def initialize(message, date)
    # @character_map = [",", ".", " ", "9", "8", "7", "6", "5", "4", "3", "2", "1", "0", "z", "y", "x", "w", "v", "u", "t", "s", "r", "q", "p", "o", "n", "m", "l", "k", "j", "i", "h", "g", "f", "e", "d", "c", "b", "a"]
    @encrypted_message = message
    @date = date
    @known_string = "..end.."
    @key = ""
  end

  def crack
    counter = "00000"
    text = ""
    loop do
      key = Key.new(counter, @date).complete_key
      decrypter = Decrypt.new(@encrypted_message, key)
      text = decrypter.decrypt_message
      counter = (counter.to_i + 1).to_s.rjust(5, "0")
    break if text.include?("..end")
    end
  @key = counter
  text
  end
end
