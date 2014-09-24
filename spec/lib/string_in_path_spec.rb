require 'spec_helper'
require 'string_in_file'

describe StringInPath do
  dir_spec_lib = File.expand_path("../", __FILE__)
  dir_parent = "#{dir_spec_lib}/temp"
  dir1 = "#{dir_parent}/dir1"
  dir1a = "#{dir_parent}/dir1/dir1a"
  dir1b = "#{dir_parent}/dir1/dir1b"
  dir2 = "#{dir_parent}/dir2"
  dir2a = "#{dir_parent}/dir2/dir2a"
  dir2b = "#{dir_parent}/dir2/dir2b"
  system("mkdir #{dir_parent}")
  system("mkdir #{dir1}")
  system("mkdir #{dir1a}")
  system("mkdir #{dir1b}")
  system("mkdir #{dir2}")
  system("mkdir #{dir2a}")
  system("mkdir #{dir2b}")
  StringInFile.write("Chuck Norris can divide by zero.", "#{dir1}/file1.txt")
  StringInFile.write("Chuck Norris can make Grumpy Cat happy.", "#{dir1a}/file1a.txt")
  StringInFile.write("Chuck Norris counted to infinity - twice.", "#{dir1b}/file1b.txt")
  StringInFile.write("Chuck Norris can start a fire by rubbing two ice cubes together.", "#{dir2}/file2.txt")
  StringInFile.write("Waldo is hiding from Chuck Norris.", "#{dir2a}/file2a.txt")
  StringInFile.write("Chuck Norris can win a game of Connect 4 in only 3 moves.", "#{dir2b}/file2b.txt")
  
  it "should determine whether a substring is in any of the files in a directory" do
    expect(StringInFile.read("#{dir1}/file1.txt")).to eq("Chuck Norris can divide by zero.")
    expect(StringInFile.read("#{dir1a}/file1a.txt")).to eq("Chuck Norris can make Grumpy Cat happy.")
    expect(StringInFile.read("#{dir1b}/file1b.txt")).to eq("Chuck Norris counted to infinity - twice.")
    expect(StringInFile.read("#{dir2}/file2.txt")).to eq("Chuck Norris can start a fire by rubbing two ice cubes together.")
    expect(StringInFile.read("#{dir2a}/file2a.txt")).to eq("Waldo is hiding from Chuck Norris.")
    expect(StringInFile.read("#{dir2b}/file2b.txt")).to eq("Chuck Norris can win a game of Connect 4 in only 3 moves.")
  end
  
  it "should confirm that a substring is present within a directory" do
  end
  
  it "should replace a substring with another substring for every file in a directory" do
  end
  
  it "should determine whether the new substring has replaced the old one in all of the files in a directory" do
    expect(StringInFile.read("#{dir1}/file1.txt")).to eq("Shelby Marx can divide by zero.")
    expect(StringInFile.read("#{dir1a}/file1a.txt")).to eq("Shelby Marx can make Grumpy Cat happy.")
    expect(StringInFile.read("#{dir1b}/file1b.txt")).to eq("Shelby Marx counted to infinity - twice.")
    expect(StringInFile.read("#{dir2}/file2.txt")).to eq("Shelby Marx can start a fire by rubbing two ice cubes together.")
    expect(StringInFile.read("#{dir2a}/file2a.txt")).to eq("Waldo is hiding from Shelby Marx.")
    expect(StringInFile.read("#{dir2b}/file2b.txt")).to eq("Shelby Marx can win a game of Connect 4 in only 3 moves.")
  end
  #system("rm -r #{dir_parent}")
end