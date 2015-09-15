class Key
  attr_accessor :key, :date, :a_position, :b_position, :c_position, :d_position

  def initialize
    @key = generate_random_key
    @date = Time.now.strftime("%d%m%y")
    # @position_array []
    @a_position = ""
    @b_position = ""
    @c_position = ""
    @d_position = ""
  end

  def generate_random_key
    random_key = ""
    5.times do
      random_key << rand(0..9).to_s
    end
    random_key
  end

  def random_abcd_positions
    @a_position = @key[0] + @key[1]
    @b_position = @key[1] + @key[2]
    @c_position = @key[2] + @key[3]
    @d_position = @key[3] + @key[4]
  end

  def complete_key
    random_abcd_positions
    date_squared = (@date.to_i * @date.to_i).to_s
    @a_position = (@a_position.to_i + (date_squared[-4]).to_i).to_s
    @b_position = (@b_position.to_i + (date_squared[-3]).to_i).to_s
    @c_position = (@c_position.to_i + (date_squared[-2]).to_i).to_s
    @d_position = (@d_position.to_i + (date_squared[-1]).to_i).to_s
  end

end

# key1 = Key.new
# key1 = Key.new
# key1.key = "12345"
# key1.date = "140915"
# key1.complete_key
