require "east/logger"

require "east/commands/migration_generator"
require "east/commands/generate_install"

module East
  DB_DIR   = "#{Rails.root}/db"
  DATA_DIR = "#{DB_DIR}/data"
  DB_MIGRATE = "#{DB_DIR}/migrate"
  
  class CommandLine
    
    def initialize(options = {})
      East::logger = options[:logger] || Loggers::StandardOut.new
    end
    
    def execute(args)
      if args[0] == "generate"
        Commands::MigrationGenerator.generate(args[1])
      else
        Commands::GenerateInstall.install
      end
    end
    
  end
end