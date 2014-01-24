class CreateFile
  def self.last_names(name_of_file)
    arr =  File.readlines(name_of_file)
    last_names = arr.map do |line| 
      next if line == ""
      line.split(" ").last
    end

    File.open("last_names_for_#{name_of_file}", "w") { |file| file.puts last_names.sort }
  end
end

#CreateFile.last_names(ARGV.first)
#CreateFile.last_names(File.basename("actors.txt"))


