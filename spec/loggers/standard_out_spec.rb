require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")


describe East::Loggers::StandardOut do
  
  it "logs to Kernel.puts" do
    Kernel.should_receive(:puts).with("hello world")
    logger = East::Loggers::StandardOut.new
    logger.log("hello world")
  end
  
end
