module RedisCrystalPlayground
  module Message
    class Print < Base
      def handle
        puts @message
      end
    end
  end
end
