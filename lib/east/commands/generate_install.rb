require "east/commands/east_migration_content_strategy"
module East::Commands
  
  class GenerateInstall
    
    def self.install
      Directory.new(East::DB_DIR, :message => "created db").do
      Directory.new(East::DB_MIGRATE, :message => "created db/migrate").do
      
      migration_name = "east"
      migration_filename = "#{East::DB_MIGRATE}/#{East::Dateitize.format(migration_name)}"
      file = FileGenerator.new(migration_filename, {:migration_name => migration_name, :message => "created db/migrate/#{East::Dateitize.format(migration_name)}"})
      file.do(EastMigrationContentStrategy)
      
    end
    
  end
  
  
end