class Item
  MIN_QUALITY = 0
  MAX_QUALITY = 50
  DEFAULT_DECREASE_QUALITY = 1
  DEFAULT_DECREASE_SELL_IN = 1

  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality; end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
