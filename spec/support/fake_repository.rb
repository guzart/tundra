class FakeRepository
  attr_accessor :data

  def initialize(*args)
    @data = args || []
  end

  def find(id)
    data.find { |i| i.id == id }
  end
end
