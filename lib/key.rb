class Key
  attr_accessor :key, :date, :position_array

  def initialize
    @key = generate_random_key
    @date = Time.now.strftime("%d%m%y")
    @position_array = []
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
    @position_array << ((@key[0] + @key[1]).to_i + (date_squared[-4]).to_i).to_s
    @position_array << ((@key[1] + @key[2]).to_i + (date_squared[-3]).to_i).to_s
    @position_array << ((@key[2] + @key[3]).to_i + (date_squared[-2]).to_i).to_s
    @position_array << ((@key[3] + @key[4]).to_i + (date_squared[-1]).to_i).to_s
  end

end


key1 = Key.new
key1.key = "12345"
key1.date = "140915"
key1.complete_key
p key1.position_array
