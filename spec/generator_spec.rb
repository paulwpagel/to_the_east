require "spec_helper"
require "east/generator"

describe East::Generator do
  
  before(:each) do
    @dir = mock(East::Commands::Directory, :do => nil)
    East::Commands::Directory.stub!(:new).and_return(@dir)
    @file = mock(East::Commands::FileGenerator, :do => nil)
    East::Commands::FileGenerator.stub!(:new).and_return(@file)
    @now = Time.now
    Time.stub!(:now).and_return(@now)
  end
    
  it "generates the directory" do
    East::Commands::Directory.should_receive(:new).with(East::Generator::DATA_DIR, :message => "created db/data").and_return(@dir)
    @dir.should_receive(:do)
    
    East::Generator::generate("name")
  end
  
  it "generates the file" do
    filename = "#{East::Generator::DATA_DIR}/#{@now.strftime("%Y%m%d%L")}_name.rb"
    East::Commands::FileGenerator.should_receive(:new).with(filename, "name", :message => "created db/data/name").and_return(@file)
    @file.should_receive(:do).with(East::Commands::MigrationContentStrategy)
    
    East::Generator::generate("name")    
  end
    
end