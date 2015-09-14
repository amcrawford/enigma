class Key
  attr_accessor :key, :date

  def initialize
    @key = generate_random_key
    @date = Time.now.strftime("%d%m%y")
  end

  def generate_random_key
    random_key = ""
    5.times do
      random_key << rand(0..10).to_s
    end
    random_key
  end

  # output complete key
    # set ABCD places
      # pull from 5 digit
      # square date
      # add date last 4 digits
end
