$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

class Rails
  def self.root
    File.expand_path(File.dirname(__FILE__) + "/")
  end
end


class Logger
  @@log = ""
  def self.log(message)
    @@log << message
  end
  
  def self.get_log
    return @@log
  end
  
  def self.clear_log
    @@log = ""
  end
  
end