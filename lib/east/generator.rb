require "east/generators/directory"
require "east/generators/file_generator"
require "east/generators/migration_content_strategy"

module East
  
  class Generator
    DATA_DIR = "#{Rails.root}/db/data"
    
    def self.generate(migration_name)
      Generators::Directory.new(DATA_DIR, :message => "created db/data").do

      migration_filename = "#{DATA_DIR}/#{Time.now.strftime("%Y%m%d%L")}_#{migration_name}.rb"
      file = Generators::FileGenerator.new(migration_filename, :message => "created db/data/#{migration_filename}")
      file.do(Generators::MigrationContentStrategy)
      
    end
      
    
  end
  
  
  
end


