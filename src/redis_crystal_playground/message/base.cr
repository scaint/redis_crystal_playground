module RedisCrystalPlayground
  module Message
    class Base
      def initialize(@message : String, @channel : String, @redis : Redis)
      end

      def handle
        raise "Not implemented"
      end

      def self.message_name
        name.split("::").last.underscore
      end
    end
  end
end
