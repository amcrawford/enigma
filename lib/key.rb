class Key
  def initialize
  end

  def generate_random_key
    random_key = ""
    5.times do
      random_key << rand(0..9).to_s
    end
    random_key
  end

  def complete_key(date = Time.now.strftime("%d%m%y"), random_key = generate_random_key)
    date_squared = (date.to_i * date.to_i).to_s
    completed_key = (0..3).inject([]) { |result, index|
      result << ((random_key[index] + random_key[index + 1]).to_i + (date_squared[(-4 + index)]).to_i).to_s
    }
  end

end
