class Key

  KEY_LENGTH = 4

  def initialize
    # @key = generate_random_key
    # @date = Time.now.strftime("%d%m%y")
    # @position_array = []
    # complete_key(Time.now.strftime("%d%m%y"), generate_random_key)
  end

  def self.generate_random_key
    random_key = ""
    5.times do
      random_key << rand(0..9).to_s
    end
    random_key
  end

  def self.complete_key(date = Time.now.strftime("%d%m%y"), random = generate_random_key)
    date_squared = (date.to_i * date.to_i).to_s
    # position_array = []

    (0..KEY_LENGTH-1).inject([]) { |result, index|
      result << ((random[index] + random[index+1]).to_i + (date_squared[(-4 + index)]).to_i).to_s

    }
    # position_array << ((random[0] + random[1]).to_i + (date_squared[-4]).to_i).to_s
    # position_array << ((random[1] + random[2]).to_i + (date_squared[-3]).to_i).to_s
    # position_array << ((random[2] + random[3]).to_i + (date_squared[-2]).to_i).to_s
    # position_array << ((random[3] + random[4]).to_i + (date_squared[-1]).to_i).to_s
    # position_array
  end

end

key = Key.complete_key
puts key

# key1 = Key.new
# key1.key = "12345"
# key1.date = "140915"
# key1.complete_key
# p key1.position_array
