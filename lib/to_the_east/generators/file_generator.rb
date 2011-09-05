require "to_the_east/setup"

module ToTheEast::Generators
  class FileGenerator
    
    def initialize(filename, options = {})
      @filename = filename
      @message = options[:message] || ""
    end
    
    def do(content_strategy)
      if !File.exists?(@filename)
        File.open(@filename, 'w') do |file|
          content_strategy.new(file).writefile 
        end
        
        Logger::log(@message)
      end
      
    end
    
  end
  
end