module ToTheEast::Generators
  class Directory

    def initialize(dir_name, options = {})
      @dir_name = dir_name
      @message = options[:message] || ""
    end

    def do
      if !Dir.exists?(@dir_name)
        FileUtils.mkdir(@dir_name)
        Logger::log(@message)
      end  
    end

  end
end