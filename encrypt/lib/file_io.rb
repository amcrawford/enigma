require_relative 'key'
require_relative 'encrypt'

class FileIO
  attr_accessor :plain_message, :encrypted_message

  def initialize(plain, encrypted)
    @plain_message = File.open(ARGV[0]).read
    @encrypted_message = File.open(ARGV[1], "w")
    @encrypter = Encrypt.new(@plain_message)
    key = @encrypter.start_key
    puts "Created '#{ARGV[1]}' with the key #{key.key} and date #{key.date}"
  end

  def write
    final_text = @encrypter.encrypt_message
    @encrypted_message.write(final_text)
  end
end



file = FileIO.new(ARGV[0], ARGV[1])
file.write
