class Key
  attr_accessor :key, :date, :a_position, :b_position, :c_position, :d_position

  def initialize
    @key = generate_random_key
    @date = Time.now.strftime("%d%m%y")
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
      # set ABCD places
    random_abcd_positions
        # pull from 5 digit
        # square date
        # add date last 4 digits
  end

end
