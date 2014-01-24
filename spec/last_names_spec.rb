require "rspec"
require "last_names"

CreateFile.last_names("actors.txt")

describe CreateFile do 

  it "creates a new file with, prepended with 'last_names'" do
    File.exists?("last_names_for_actors.txt").should be_true
  end
  
  it "contains the sorted last names" do
    File.readlines("last_names_for_actors.txt").should == File.readlines("solution.txt")
  end
  
  
end
