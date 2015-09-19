require_relative 'brute_force_attempt'

class FileIO

  def initialize(encrypted_message, output, date)
    @encrypted_text_string = File.open(ARGV[0]).read
    @decrypted_msg_without_key = File.open(ARGV[1], 'w')
    @date = ARGV[2]
    @final_text = BruteForce.new(encrypted_message, @date).crack
    puts "Created #{ARGV[1]} with key the date #{@date}"
  end

  def write
    @decrypted_msg_without_key.write(@final_text)
  end

end

file = FileIO.new(ARGV[0], ARGV[1], ARGV[2])
file.write
