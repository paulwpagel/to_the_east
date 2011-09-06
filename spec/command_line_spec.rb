require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require "east/command_line"

describe East::CommandLine do
  
  
  context "logging" do
    
    it "overrides the logger" do
      East::logger.class.should == East::Loggers::InMemory
      East::CommandLine.new(:logger => East::Loggers::InMemory.new)
      East::logger.class.should == East::Loggers::InMemory
    end
  
    it "defaults to standard out" do
      East::logger.class.should == East::Loggers::InMemory
      East::CommandLine.new
      East::logger.class.should == East::Loggers::StandardOut
    end
    
  end
  
  context "usage" do
    
  end
  
  context "generate" do
  
    before(:each) do
      @command_line = East::CommandLine.new(:logger => East::Loggers::InMemory.new)
    end
  
    it "generates a data migration" do
      East::Generator.should_receive(:generate).with("convert_to_metric")
      @command_line.execute(["generate", "convert_to_metric"])
    end
    
  end
  
end
