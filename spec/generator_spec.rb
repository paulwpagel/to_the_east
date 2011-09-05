require "spec_helper"
require "to_the_east/generator"

describe ToTheEast::Generator do
  
  before(:each) do
    @dir = mock(ToTheEast::Generators::Directory, :do => nil)
    ToTheEast::Generators::Directory.stub!(:new).and_return(@dir)
    @file = mock(ToTheEast::Generators::FileGenerator, :do => nil)
    ToTheEast::Generators::FileGenerator.stub!(:new).and_return(@file)
    @now = Time.now
    Time.stub!(:now).and_return(@now)
  end
    
  it "generates the directory" do
    ToTheEast::Generators::Directory.should_receive(:new).with(ToTheEast::Generator::DATA_DIR, :message => "created db/data").and_return(@dir)
    @dir.should_receive(:do)
    
    ToTheEast::Generator::generate("name")
  end
  
  
  
  it "generates the file" do
    filename = "#{ToTheEast::Generator::DATA_DIR}/#{@now.strftime("%Y%m%d%L")}_name.rb"
    ToTheEast::Generators::FileGenerator.should_receive(:new).with(filename, :message => "created db/data/#{filename}").and_return(@file)
    @file.should_receive(:do).with(ToTheEast::Generators::MigrationContentStrategy)
    
    ToTheEast::Generator::generate("name")    
  end
    
end