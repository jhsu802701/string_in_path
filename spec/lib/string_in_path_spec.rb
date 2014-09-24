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
  it "should write text to files" do
    system("mkdir -p #{dir_parent}")
    system("mkdir -p #{dir1}")
    system("mkdir -p #{dir1a}")
    system("mkdir -p #{dir1b}")
    system("mkdir -p #{dir2}")
    system("mkdir -p #{dir2a}")
    system("mkdir -p #{dir2b}")
    StringInFile.write("Chuck Norris can divide by zero.", "#{dir1}/file1.txt")
    StringInFile.write("Chuck Norris can make Grumpy Cat happy.", "#{dir1a}/file1a.txt")
    StringInFile.write("Chuck Norris counted to infinity - twice.", "#{dir1b}/file1b.txt")
    StringInFile.write("Chuck Norris can start a fire by rubbing two ice cubes together.", "#{dir2}/file2.txt")
    StringInFile.write("Waldo is hiding from Chuck Norris.", "#{dir2a}/file2a.txt")
    StringInFile.write("Chuck Norris can win a game of Connect 4 in only 3 moves.", "#{dir2b}/file2b.txt")
  end
  
  it "should determine whether a substring is in any of the files in a directory" do
    expect(StringInPath.present("divide by zero", "#{dir1}")).to eq(true)
    expect(StringInPath.present("divide by zero", "#{dir1a}")).to eq(false)
    expect(StringInPath.present("divide by zero", "#{dir1b}")).to eq(false)
    expect(StringInPath.present("divide by zero", "#{dir2}")).to eq(false)
    expect(StringInPath.present("divide by zero", "#{dir2a}")).to eq(false)
    expect(StringInPath.present("divide by zero", "#{dir2b}")).to eq(false)
    
    expect(StringInPath.present("Grumpy Cat", "#{dir1}")).to eq(true)
    expect(StringInPath.present("Grumpy Cat", "#{dir1a}")).to eq(true)
    expect(StringInPath.present("Grumpy Cat", "#{dir1b}")).to eq(false)
    expect(StringInPath.present("Grumpy Cat", "#{dir2}")).to eq(false)
    expect(StringInPath.present("Grumpy Cat", "#{dir2a}")).to eq(false)
    expect(StringInPath.present("Grumpy Cat", "#{dir2b}")).to eq(false)   
    
    expect(StringInPath.present("counted to infinity", "#{dir1}")).to eq(true)
    expect(StringInPath.present("counted to infinity", "#{dir1a}")).to eq(false)
    expect(StringInPath.present("counted to infinity", "#{dir1b}")).to eq(true)
    expect(StringInPath.present("counted to infinity", "#{dir2}")).to eq(false)
    expect(StringInPath.present("counted to infinity", "#{dir2a}")).to eq(false)
    expect(StringInPath.present("counted to infinity", "#{dir2b}")).to eq(false)
    
    expect(StringInPath.present("ice cubes", "#{dir1}")).to eq(false)
    expect(StringInPath.present("ice cubes", "#{dir1a}")).to eq(false)
    expect(StringInPath.present("ice cubes", "#{dir1b}")).to eq(false)
    expect(StringInPath.present("ice cubes", "#{dir2}")).to eq(true)
    expect(StringInPath.present("ice cubes", "#{dir2a}")).to eq(false)
    expect(StringInPath.present("ice cubes", "#{dir2b}")).to eq(false)
    
    expect(StringInPath.present("Waldo", "#{dir1}")).to eq(false)
    expect(StringInPath.present("Waldo", "#{dir1a}")).to eq(false)
    expect(StringInPath.present("Waldo", "#{dir1b}")).to eq(false)
    expect(StringInPath.present("Waldo", "#{dir2}")).to eq(true)
    expect(StringInPath.present("Waldo", "#{dir2a}")).to eq(true)
    expect(StringInPath.present("Waldo", "#{dir2b}")).to eq(false)
    
    expect(StringInPath.present("Connect 4", "#{dir1}")).to eq(false)
    expect(StringInPath.present("Connect 4", "#{dir1a}")).to eq(false)
    expect(StringInPath.present("Connect 4", "#{dir1b}")).to eq(false)
    expect(StringInPath.present("Connect 4", "#{dir2}")).to eq(true)
    expect(StringInPath.present("Connect 4", "#{dir2a}")).to eq(false)
    expect(StringInPath.present("Connect 4", "#{dir2b}")).to eq(true)
  end
  
  it "should replace a substring in every file in a directory with a different substring" do
    StringInPath.replace("Chuck Norris", "Shelby Marx", "#{dir1}")
    StringInPath.replace("Chuck Norris", "Shelby Marx", "#{dir2}")
  end
  
  it "should verify that the process of replacing every substring in every file in a directory succeeded" do
    expect(StringInFile.read("#{dir1}/file1.txt")).to eq("Shelby Marx can divide by zero.")
    expect(StringInFile.read("#{dir1a}/file1a.txt")).to eq("Shelby Marx can make Grumpy Cat happy.")
    expect(StringInFile.read("#{dir1b}/file1b.txt")).to eq("Shelby Marx counted to infinity - twice.")
    expect(StringInFile.read("#{dir2}/file2.txt")).to eq("Shelby Marx can start a fire by rubbing two ice cubes together.")
    expect(StringInFile.read("#{dir2a}/file2a.txt")).to eq("Waldo is hiding from Shelby Marx.")
    expect(StringInFile.read("#{dir2b}/file2b.txt")).to eq("Shelby Marx can win a game of Connect 4 in only 3 moves.")
    system("rm -r #{dir_parent}")
  end

end