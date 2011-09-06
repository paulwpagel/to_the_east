require "east/commands/directory"
require "east/commands/file_generator"
require "east/commands/migration_content_strategy"

module East
  
  class Generator
    DATA_DIR = "#{Rails.root}/db/data"
    
    def self.generate(migration_name)
      Commands::Directory.new(DATA_DIR, :message => "created db/data").do

      migration_filename = "#{DATA_DIR}/#{Time.now.strftime("%Y%m%d%L")}_#{migration_name}.rb"
      file = Commands::FileGenerator.new(migration_filename, migration_name, :message => "created db/data/#{migration_name}")
      file.do(Commands::MigrationContentStrategy)
      
    end
      
    
  end
  
  
  
end


