require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "east/commands/directory"

describe East::Commands::Directory do
  
  before do
    East::logger = East::Loggers::InMemory.new  
    @db_dir = File.expand_path(File.dirname(__FILE__) + "/data")
    East::Commands::Directory.new(@db_dir, :message => "created db/data").do
  end
  
  after(:each) do
    FileUtils.rm_rf(@db_dir) unless @db_dir.empty? or @db_dir == "/"
  end
  
  it "generates the data folder" do
    Dir.exists?(@db_dir).should be_true
  end

  it "logs the creation of a directory" do
    East::logger.contents.should include("created db/data")
  end
  
end
