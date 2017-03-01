class BaseEvent
  def self.exchange(name)
    @exchange = name
  end

  def self.routing_key(name)
    @routing_key = name
  end
end

