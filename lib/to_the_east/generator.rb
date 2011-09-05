require "to_the_east/generators/directory"
require "to_the_east/generators/file_generator"
require "to_the_east/generators/migration_content_strategy"

module ToTheEast
  
  class Generator
    DATA_DIR = "#{Rails.root}/db/data"
    
    def self.generate(migration_name)
      ToTheEast::Generators::Directory.new(DATA_DIR, :message => "created db/data").do

      migration_filename = "#{DATA_DIR}/#{Time.now.strftime("%Y%m%d%L")}_#{migration_name}.rb"
      file = ToTheEast::Generators::FileGenerator.new(migration_filename, :message => "created db/data/#{migration_filename}")
      file.do(ToTheEast::Generators::MigrationContentStrategy)
      
    end
      
    
  end
  
  
  
end


