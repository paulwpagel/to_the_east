$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

class Rails
  def self.root
    File.expand_path(File.dirname(__FILE__) + "/")
  end
end


class MockFile
  attr_accessor :contents
  def initialize
    @contents = ""
  end
  
  def write(value)
    @contents << value
  end
  
end
