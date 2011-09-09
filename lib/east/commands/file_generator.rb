require "east/setup"

module East::Commands
  class FileGenerator
    
    def initialize(filename, options = {})
      @filename = filename
      @options = options
      @message = options[:message] || ""
    end
    
    def do(content_strategy)
      if !File.exists?(@filename)
        File.open(@filename, 'w') do |file|
          content_strategy.new(file, @options).writefile
        end

        East::logger.log(@message)
      end
      
    end
    
  end
  
end