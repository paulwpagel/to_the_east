require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "east/commands/generate_install"

describe East::Commands::GenerateInstall do
  
  before(:each) do
    @dir = mock(East::Commands::Directory, :do => nil)
    @command = East::Commands::GenerateInstall
    stub_time
  end
  
  it "generates the db directory" do
    East::Commands::Directory.should_receive(:new).with(East::DB_DIR, :message => "created db").and_return(@dir)
    East::Commands::Directory.should_receive(:new).with(East::DB_MIGRATE, :message => "created db/migrate").and_return(@dir)
    @dir.should_receive(:do).twice
    
    East::Commands::GenerateInstall::install
  end
    
  it "generates an active record schema migration" do
    East::Commands::FileGenerator.should_receive(:new).with(anything, {:migration_name => "east", :message => "created db/migrate/#{East::Dateitize.format("east")}"}).and_return(@dir)
    @command.install
  end
  
end
