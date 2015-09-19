require_relative 'crack'

class FileIO

  def initialize(input, output, date)
    @input = File.open(ARGV[0]).read.chomp
    @output = File.open(ARGV[1], 'w')
    @date = ARGV[2]
    @encrypter = Crack.new(@input, @date)
    @key = @encrypter.crack
    puts "Created #{ARGV[1]} with key #{@key} the date #{@date}"
  end

  def decrypt_text
    final_text = @encrypter.decrypt_file
  end


  def write
    @output.write(decrypt_text)
  end

end

file = FileIO.new(ARGV[0], ARGV[1], ARGV[2])
file.write
