require "spec_helper"
require "east/commands/migration_generator"

describe East::Commands::MigrationGenerator do
  
  before(:each) do
    @dir = mock(East::Commands::Directory, :do => nil)
    East::Commands::Directory.stub!(:new).and_return(@dir)
    @file = mock(East::Commands::FileGenerator, :do => nil)
    East::Commands::FileGenerator.stub!(:new).and_return(@file)
    stub_time
  end
    
  it "generates the db directory" do
    East::Commands::Directory.should_receive(:new).with(East::DB_DIR, :message => "created db").and_return(@dir)
    @dir.should_receive(:do)
    
    East::Commands::MigrationGenerator::generate("name")
  end
  
  it "generates the data directory" do
    East::Commands::Directory.should_receive(:new).with(East::DATA_DIR, :message => "created db/data").and_return(@dir)
    @dir.should_receive(:do)
    
    East::Commands::MigrationGenerator::generate("name")
  end
  
  it "generates the file" do
    filename = "#{East::DATA_DIR}/#{@now.strftime("%Y%m%d%L")}_name.rb"
    East::Commands::FileGenerator.should_receive(:new).with(filename, {:migration_name => "name", :message => "created db/data/#{filename}"}).and_return(@file)
    @file.should_receive(:do).with(East::Commands::MigrationContentStrategy)
    
    East::Commands::MigrationGenerator::generate("name")    
  end
    
end