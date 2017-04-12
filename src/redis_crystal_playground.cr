require "redis"
require "./redis_crystal_playground/message/base"
require "./redis_crystal_playground/message/bye"
require "./redis_crystal_playground/message/print"
require "./redis_crystal_playground/subscriber"

module RedisCrystalPlayground
  s = Subscriber.new("dummy_channel", Redis.new)
  s.register_message(Message::Bye)
  s.register_message(Message::Print)
  s.subscribe
end
