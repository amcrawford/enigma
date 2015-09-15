class Key
  attr_accessor :key, :date, :position_hash

  def initialize
    @key = generate_random_key
    @date = Time.now.strftime("%d%m%y")
    @position_hash = {}
  end

  def generate_random_key
    random_key = ""
    5.times do
      random_key << rand(0..9).to_s
    end
    random_key
  end

  def complete_key
    date_squared = (@date.to_i * @date.to_i).to_s
    @position_hash[:a_rot] = ((@key[0] + @key[1]).to_i + (date_squared[-4]).to_i).to_s
    @position_hash[:b_rot] = ((@key[1] + @key[2]).to_i + (date_squared[-3]).to_i).to_s
    @position_hash[:c_rot] = ((@key[2] + @key[3]).to_i + (date_squared[-2]).to_i).to_s
    @position_hash[:d_rot] = ((@key[3] + @key[4]).to_i + (date_squared[-1]).to_i).to_s
  end

end

# key1 = Key.new
# key1 = Key.new
# key1.key = "12345"
# key1.date = "140915"
# puts key1.complete_key
