require_relative 'crack'
require_relative '../../decrypt/lib/decrypt'

class FileIO

  def initialize(encrypted_message, output, date)
    @encrypted_text_string = File.open(ARGV[0]).read
    @decrypted_msg_without_key = File.open(ARGV[1], 'w')
    @date = (ARGV[2])
    @key = Crack.new(encrypted_message, @date).crack
    @final_text = ""
    puts "Created #{ARGV[1]} with the date #{@date}"
  end

  def decrypt_text
    decrypter = Decrypt.new(@encrypted_text_string, "99999", @date)
    decrypter.complete_key = @key
    @final_text = decrypter.decrypt_message
  end

  def write
    @decrypted_msg_without_key.write(@final_text)
  end

end

file = FileIO.new(ARGV[0], ARGV[1], ARGV[2])
file.decrypt_text
file.write
