class GildedRose
  STANDARD_QUALITY = 1
  STANDARD_SELL_IN = 1
  SKIP_DECREASE_SELL_IN = %w[Sulfuras].freeze

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      update_item_quality(item)
      decrease_sell_in(item)
    end
  end

  private

  def update_item_quality(item)
    case item.name
    when /Aged Brie/
      update_aged_brie_quality(item)
    when /Backstage passes/
      update_backstage_quality(item)
    when /Sulfuras/
      nil
    when /Conjured/
      update_conjured_quality(item)
    else
      decrease_quality(item)
    end
  end

  def update_item_sell_in(item)
    return if SKIP_DECREASE_SELL_IN.any? { |name| /#{name}/.match?(item.name) }

    item.sell_in -= STANDARD_SELL_IN
  end

  def update_aged_brie_quality(item)
    increase_quality(item)
  end

  def update_backstage_quality(item)
    case item.sell_in
    when (6..10)
      increase_quality(item, 2)
    when (1..5)
      increase_quality(item, 3)
    when 0
      item.quality = 0
    else
      decrease_quality(item)
    end
  end

  def update_conjured_quality(item)
    amount = standard_quality(item) * 2
    decrease_quality(item, amount)
  end

  def increase_quality(item, amount = nil)
    amount ||= standard_quality(item)
    increased_quality = item.quality + amount
    return if increased_quality > 50

    item.quality = increased_quality
  end

  def decrease_quality(item, amount = nil)
    amount ||= standard_quality(item)
    decreased_quality = item.quality - amount
    return if decreased_quality.negative?

    item.quality = decreased_quality
  end

  def standard_quality(item)
    return STANDARD_QUALITY if item.sell_in > 0

    STANDARD_QUALITY * 2
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
