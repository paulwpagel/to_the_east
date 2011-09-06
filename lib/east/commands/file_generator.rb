require "east/setup"

module East::Commands
  class FileGenerator
    
    def initialize(filename, migration_name, options = {})
      @filename = filename
      @migration_name = migration_name
      @message = options[:message] || ""
    end
    
    def do(content_strategy)
      if !File.exists?(@filename)
        File.open(@filename, 'w') do |file|
          content_strategy.new(file).writefile(@migration_name)
        end
        
        East::logger.log(@message)
      end
      
    end
    
  end
  
end