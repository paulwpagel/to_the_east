require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require "east/dateitize"
describe East::Dateitize do
  
  before(:each) do
    stub_time
  end
  
  it "takes a filename and makes it a date" do
    East::Dateitize.format("").should == ""
    East::Dateitize.format("migration").should == "#{@now.strftime("%Y%m%d%L")}_migration.rb"
  end
  
end
