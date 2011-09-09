require "east/commands/directory"
require "east/commands/file_generator"
require "east/commands/migration_content_strategy"
require "east/dateitize"

module East::Commands
  
  class MigrationGenerator
    
    def self.generate(migration_name)
      Directory.new(East::DB_DIR, :message => "created db").do
      Directory.new(East::DATA_DIR, :message => "created db/data").do

      migration_filename = "#{East::DATA_DIR}/#{East::Dateitize.format(migration_name)}"
      file = FileGenerator.new(migration_filename, {:migration_name => migration_name, :message => "created db/data/#{migration_filename}"})
      file.do(MigrationContentStrategy)
    end
      
    
  end
  
  
  
end


