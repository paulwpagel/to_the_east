module East::Loggers
  class StandardOut
    
    def log(message)
      Kernel.puts message
    end    
    
  end
end