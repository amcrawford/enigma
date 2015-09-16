class Key
  attr_accessor :complete_key
  def initialize(start_key, date)
    @start_key = start_key
    @date = date
    @complete_key = complete_key
  end

  def complete_key
    date_squared = (@date.to_i * @date.to_i).to_s
    position_array = []
    position_array << ((@start_key[0] + @start_key[1]).to_i + (date_squared[-4]).to_i).to_s
    position_array << ((@start_key[1] + @start_key[2]).to_i + (date_squared[-3]).to_i).to_s
    position_array << ((@start_key[2] + @start_key[3]).to_i + (date_squared[-2]).to_i).to_s
    position_array << ((@start_key[3] + @start_key[4]).to_i + (date_squared[-1]).to_i).to_s
    position_array
  end
end
