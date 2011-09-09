require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe East::Commands::MigrationContentStrategy do
  
  before(:each) do
    @file = MockFile.new
    East::Commands::MigrationContentStrategy.new(@file, {:migration_name => "first_migration"}).writefile
  end
  
  it "generates up and down methods" do
    file_contents = @file.contents
    file_contents.should include("class FirstMigration")
    file_contents.should include("def self.up")
    file_contents.should include("def self.down")
  end
  
end
