require_relative 'crack'

class FileIO

  def initialize(encrypted_message, output, date)
    @encrypted_text_string = File.open(ARGV[0]).read
    @decrypted_msg_without_key = File.open(ARGV[1], 'w')
    @date = (ARGV[2])
    @encrypter = Crack.new(encrypted_message, @date)
    @key = @encrypter.crack
    puts "Created #{ARGV[1]} with key #{@key} the date #{@date}"
  end

  def decrypt_text
    final_text = @encrypter.decrypt_file
  end

  def write
    @decrypted_msg_without_key.write(decrypt_text)
  end

end

file = FileIO.new(ARGV[0], ARGV[1], ARGV[2])
file.write
