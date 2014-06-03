class FrequencyHash
  def self.create(name_of_file)
    word_freq = Hash.new()

    File.readlines(name_of_file).each do |line| 
      next if line == "" #skip blank lines
      word = line.downcase.gsub(/\W+/, "")  #ignore case, punction and whitespace
      word_freq[word] ||= 0
      word_freq[word] += 1
    end

    word_freq.keep_if {|word, freq| freq > 1} #keep only words with freq > 1
    freq_array = word_freq.sort_by &:last #convert into sorted array 
    freq_array.reverse! #order descending
    freq_array.map! {|el| "#{el.first} #{el.last}"} #format data as specified


    File.open("word_frequency_for_#{name_of_file}", "w") { |file| file.puts freq_array }
  end
end

#runs the script if this file is at the top of the call stack, skips if file is being called from spec
FrequencyHash.create(ARGV.first) if __FILE__ == $0 




