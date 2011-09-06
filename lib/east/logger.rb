require "east/loggers/in_memory"
require "east/loggers/standard_out"

module East
  
  @@logger = nil
  def self.logger
    @@logger = Loggers::InMemory.new if @@logger.nil?
    return @@logger
  end
  
  def self.logger=(value)
    @@logger = value
  end
  
end
