require "east/logger"
require "east/generator"

module East
  
  class CommandLine
    
    def initialize(options = {})
      East::logger = options[:logger] || Loggers::StandardOut.new
    end
    
    def execute(args)
      migration_filename = args[1]
      Generator.generate(migration_filename)
    end
    
  end
end