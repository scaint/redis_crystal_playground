module RedisCrystalPlayground
  class Subscriber
    def initialize(@channel : String, @redis : Redis)
      @messages = {} of String => Message::Base.class
    end

    def register_message(message_class)
      @messages[message_class.message_name] = message_class
    end

    def subscribe
      @redis.subscribe(@channel) do |on|
        on.subscribe do |channel|
          log "Subscribe to #{channel}"
        end

        on.message do |channel, message|
          if @messages.has_key?(message)
            log "Message: #{message}"
            @messages[message].new(message, channel, @redis).handle
          else
            log "Unknown message: #{message}"
          end
        end

        on.unsubscribe do |channel|
          log "Unsubscribe from #{channel}"
        end
      end
    end

    private def log(msg)
      puts "[#{self.class.name}] #{msg}"
    end
  end
end
