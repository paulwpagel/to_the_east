module East::Commands
  class MigrationContentStrategy
    
    def initialize(file, options = {})
      @migration_name = options[:migration_name]
      @file = file
    end
    
    def writefile
      writeline("class #{@migration_name.camelize}")
      writeline
      tabbed_line("def self.up", 1)
      tabbed_line("end", 1)
      writeline
      tabbed_line("def self.down", 1)
      
      tabbed_line("end", 1)
      writeline
      writeline("end")
    end
    
    def writeline(contents = "")
      @file.write("#{contents}\n")
    end

    def tabbed_line(contents, tabs)
      tabs.times { @file.write("\t")}
      writeline contents
    end    
  end
end
  