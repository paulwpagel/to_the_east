module East::Commands
  class MigrationContentStrategy
    
    def initialize(file)
      @file = file
    end
    
    def writefile(migration_name)
      writeline("class #{migration_name.camelize}")

      tabbed_line("def self.up", 1)
      tabbed_line("end", 1)
      
      tabbed_line("def self.down", 1)
      tabbed_line("end", 1)
      
      writeline("end")
      
    end
    
    def writeline(contents)
      @file.write("#{contents}\n")
    end

    def tabbed_line(contents, tabs)
      tabs.times { @file.write("\t")}
      writeline contents
    end    
  end
end
  