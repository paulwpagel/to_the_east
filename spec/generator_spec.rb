require "spec_helper"
require "to_the_east/generator"

describe ToTheEast::Generator do
  
  before(:each) do
    @db_dir = File.expand_path(File.dirname(__FILE__) + "/db")
    FileUtils.mkdir(@db_dir)
    @now = Time.now
    Logger::clear_log
    Time.stub!(:now).and_return(@now)
  end
  
  after(:each) do
    FileUtils.rm_rf(@db_dir) unless @db_dir.empty? or @db_dir == "/"
  end
  
  context "creating the data folder" do
    
    before do
      ToTheEast::Generator::generate "first_migration"
    end
    
    it "generates the data folder" do
      Dir.exists?("#{@db_dir}/data").should be_true
    end
  
    it "logs the creation of a directory" do
      Logger.get_log.should include("created db/data")
    end
  end
  
  context "generating the file" do
    
    before do
      ToTheEast::Generator::generate "first_migration"
      @migration_filename = "#{@db_dir}/data/#{@now.strftime("%Y%m%d%L")}_first_migration.rb"
    end
    
    it "starts the file with a timestamp" do
      File.exists?(@migration_filename).should be_true
    end
    
    it "generates up and down methods" do
      file_contents = IO.read(@migration_filename)
      file_contents.should include("class FirstMigration")
      file_contents.should include("def self.up")
      file_contents.should include("def self.down")
    end
    
    it "logs that it created the file" do
      Logger.get_log.should include("created db/data/#{@migration_filename}")
    end

  end
  
end