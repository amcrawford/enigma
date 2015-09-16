require_relative 'decrypt'

class FileIO

  def initialize(encrypted, plain, key, date)
    @encrypted_message = File.open(ARGV[0]).read
    @plain_message = File.open(ARGV[1], "w")
    @key = key
    @date = date
    puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"
  end

  def write
    decrypter = Decrypt.new(@encrypted_message, @key, @date)
    final_message = decrypter.decrypt_message
    @plain_message.write(final_message)
  end


end



file = FileIO.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
file.write
