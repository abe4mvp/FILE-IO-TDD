require "rspec"
require "./frequency_hash"

FrequencyHash.create("example.txt")

describe FrequencyHash do 

  it "creates a new file with the appropriate name" do
    File.exists?("word_frequency_for_example.txt").should be_true
  end

  file_lines = File.readlines("word_frequency_for_example.txt")
  
  it "contains the sorted frequencies" do
    file_lines.should == File.readlines("solution.txt")
  end
  
  it "ignores punctuation and capitalization" do
    file_lines.should include("apple 3\n")
  end

  it "ignores whitespace" do
    file_lines.should include("lorem 2\n")
  end

  it "does not contain words that appear only once" do
    file_lines.join().should_not match(/hello/)
  end

  it "should output the result in the proper format" do
    file_lines.all? {|line| /[a-z]+\s\d+/.match(line)}.should be_true
  end

end
