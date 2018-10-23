require_relative 'item'
require_relative 'normal_item'
require_relative 'aged_brie_item'
require_relative 'backstage_item'
require_relative 'conjured_item'

module GildedRose
  DEFAULT_CLASS = NormalItem
  CUSTOM_CLASSES = {
    'Aged Brie' => AgedBrieItem,
    'Backstage' => BackstageItem,
    'Sulfuras'  => Item,
    'Conjured'  => ConjuredItem
  }.freeze

  def self.for(name, sell_in, quality)
    klass_for(name).new(name, sell_in, quality)
  end

  def self.klass_for(name)
    CUSTOM_CLASSES[name] || DEFAULT_CLASS
  end
end
