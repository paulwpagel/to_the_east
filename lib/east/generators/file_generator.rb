require "east/setup"

module East::Generators
  class FileGenerator
    
    def initialize(filename, options = {})
      @filename = filename
      @message = options[:message] || ""
    end
    
    def do(content_strategy)
      if !File.exists?(@filename)
        File.open(@filename, 'w') do |file|
          content_strategy.new(file).writefile(@filename)
        end
        
        East::logger.log(@message)
      end
      
    end
    
  end
  
end