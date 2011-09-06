require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "east/commands/file_generator"

describe East::Commands::FileGenerator  do
  
  context "generating the file" do
    
    before(:each) do
      East::logger = East::Loggers::InMemory.new  
      @migration_filename = "first_migration.rb"
      @migration_name = "first_migration"
      @message = "created db/data/#{@migration_name}"
      @content_strategy = mock("strategy", :writefile => nil)
      @strategy_factory = mock('content strategy factory', :new => @content_strategy)
    end
    
    after(:each) do
      File.delete(@migration_filename) if File.exists?(@migration_filename)
    end
    
    def call_do
      East::Commands::FileGenerator.new(@migration_filename, @migration_name, :message => @message).do(@strategy_factory)
    end
    
    it "starts the file with a timestamp" do
      call_do
      File.exists?(@migration_filename).should be_true
    end
    
    it "calls the content strategy" do
      @strategy_factory.should_receive(:new).with(anything).and_return(@content_strategy)
      @content_strategy.should_receive(:writefile).with(@migration_name)
      call_do
    end
    
    it "logs that it created the file" do
      call_do
      East::logger.contents.should include(@message)
    end

  end
  
end