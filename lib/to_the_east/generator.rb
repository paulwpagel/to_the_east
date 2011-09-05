class String
  
  def camelize
    self.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
  end
  
end

module ToTheEast
  
  
  class Generator
    DATA_DIR = "#{Rails.root}/db/data"
    
    def self.generate(migration_name)
      
      if !Dir.exists?(DATA_DIR)
        FileUtils.mkdir(DATA_DIR)
        Logger::log("created db/data")
      end
      
      migration_filename = "#{DATA_DIR}/#{Time.now.strftime("%Y%m%d%L")}_#{migration_name}.rb"
      if !File.exists?(migration_filename)
        File.open(migration_filename, 'w') do |f| 
          writeline(f, "class #{migration_name.camelize}")

          tabbed_line(f, "def self.up", 1)
          tabbed_line(f, "end", 1)
          
          tabbed_line(f, "def self.down", 1)
          tabbed_line(f, "end", 1)
          
          writeline(f, "end")
        end
        
        Logger::log("created db/data/#{migration_filename}")
      end
      
    end
    
    def self.writeline(file, contents)
      file.write("#{contents}\n")
    end
    
    def self.tabbed_line(file, contents, tabs)
      tabs.times {file.write("\t")}
      writeline file, contents
    end
    
  end
  
  
end


