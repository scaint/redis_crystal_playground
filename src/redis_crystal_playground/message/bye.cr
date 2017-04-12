module RedisCrystalPlayground
  module Message
    class Bye < Base
      def handle
        @redis.unsubscribe(@channel)
      end
    end
  end
end
