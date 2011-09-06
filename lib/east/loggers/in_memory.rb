module East
  module Loggers
    class InMemory
      attr_accessor :contents
      def initialize
       @contents = "" 
      end

      def log(message)
        @contents << message
      end

      def clear_log
        @contents = ""
      end
    end
    
  end
end