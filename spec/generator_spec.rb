require "spec_helper"
require "east/generator"

describe East::Generator do
  
  before(:each) do
    @dir = mock(East::Generators::Directory, :do => nil)
    East::Generators::Directory.stub!(:new).and_return(@dir)
    @file = mock(East::Generators::FileGenerator, :do => nil)
    East::Generators::FileGenerator.stub!(:new).and_return(@file)
    @now = Time.now
    Time.stub!(:now).and_return(@now)
  end
    
  it "generates the directory" do
    East::Generators::Directory.should_receive(:new).with(East::Generator::DATA_DIR, :message => "created db/data").and_return(@dir)
    @dir.should_receive(:do)
    
    East::Generator::generate("name")
  end
  
  it "generates the file" do
    filename = "#{East::Generator::DATA_DIR}/#{@now.strftime("%Y%m%d%L")}_name.rb"
    East::Generators::FileGenerator.should_receive(:new).with(filename, :message => "created db/data/#{filename}").and_return(@file)
    @file.should_receive(:do).with(East::Generators::MigrationContentStrategy)
    
    East::Generator::generate("name")    
  end
    
end