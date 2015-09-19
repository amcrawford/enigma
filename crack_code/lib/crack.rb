class Crack
  attr_accessor :encrypted_message

  def initialize(message, date)
    @character_map = [",", ".", " ", "9", "8", "7", "6", "5", "4", "3", "2", "1", "0", "z", "y", "x", "w", "v", "u", "t", "s", "r", "q", "p", "o", "n", "m", "l", "k", "j", "i", "h", "g", "f", "e", "d", "c", "b", "a"]
    @encrypted_message = message
    @date = date
    @known_string = "..end.."
    @start_key = []
  end

  def crack
    rotate_map(set_messages_by_remainder)
  end

  def found_remainder
    @encrypted_message.length % 4 #0123
  end

  def set_messages_by_remainder
    popped_message_array = @encrypted_message.chars
    popped_message_array.pop(found_remainder)
    final_message_chunk = []

    4.times do |i|
      final_message_chunk << (popped_message_array[-1 - i])
    end

    popped_known_array = @known_string.chars
    popped_known_array.pop(found_remainder)
    final_known_chunk = []

    4.times do |i|
      final_known_chunk << (popped_known_array[-1 - i])
    end
    final_message_chunk.reverse.zip(final_known_chunk.reverse)
  end


  def rotate_map(array)
    key = []
    current_map = @character_map
    array.each do |pair|
      counter = 0
      loop do
        current_map = current_map.rotate
        break if current_map[0] == pair[0]
      end
      loop do
        current_map = current_map.rotate
        counter += 1
        break if current_map[0] == pair[1]
      end
      key << counter.to_s
    end
    @start_key = key
  end

  # def last_four_of_squared_date
  #   square = @date.to_i * @date.to_i
  #   square.to_s[-4..-1].chars
  # end

 #  def middle_key
 #    bucket = @start_key.zip(last_four_of_squared_date).map do |pair|
 #     (pair[0].to_i - pair[1].to_i).to_s.rjust(2, "0")
 #   end
 #   bucket.join
 # end
 #
 # def calculate_key
 #   middle_key[0] + middle_key[1] + middle_key[3] + middle_key[6] + middle_key[7]
 # end

end

#
# crack = Crack.new("Amber", "140915")
# p crack.set_messages_by_remainder
