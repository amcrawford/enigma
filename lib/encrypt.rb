require_relative 'key'

class FileIO
  attr_accessor :plain_message, :encrypted_message, :final_text

  def initialize(plain, encrypted)
    @plain_message = File.open(ARGV[0]).read
    @encrypted_message = File.open(ARGV[1], "w")
    @final_text = ""
    key = Key.new
    puts "Created '#{ARGV[1]}' with the key #{key.key} and date #{key.date}"
  end

end

file = FileIO.new(ARGV[0], ARGV[1])
