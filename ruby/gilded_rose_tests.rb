require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'test/unit'

class TestUntitled < Test::Unit::TestCase
  def test_lowers_quality_and_sell_in_by_1
    items = [Item.new('name', 1, 1)]
    GildedRose.new(items).update_quality
    item = items.first

    assert_equal(item.sell_in, 0)
    assert_equal(item.quality, 0)
  end

  def test_if_sell_date_passed_quality_degrades_twice
    items = [Item.new('name', 0, 2)]
    GildedRose.new(items).update_quality

    assert_equal(items.first.quality, 0)
  end

  def test_quality_cant_be_negative
    items = [Item.new('name', 0, 0)]
    GildedRose.new(items).update_quality

    assert(!items.first.quality.negative?)
  end

  def test_aged_brie_quality_increases_by_1
    items = [Item.new('Aged Brie', 1, 0)]
    GildedRose.new(items).update_quality

    assert_equal(items.first.quality, 1)
  end

  def test_aged_brie_quality_increases_by_2
    items = [Item.new('Aged Brie', 0, 0)]
    GildedRose.new(items).update_quality

    assert_equal(items.first.quality, 2)
  end

  def test_quality_cannot_increase_more_than_50
    items = [Item.new('Aged Brie', 0, 50)]
    GildedRose.new(items).update_quality

    assert_equal(items.first.quality, 50)
  end

  def test_sulfuras_dont_change_quality_and_sell_in
    items = [Item.new('Sulfuras, Hand of Ragnaros', 1, 80)]
    GildedRose.new(items).update_quality
    item = items.first

    assert_equal(item.sell_in, 1)
    assert_equal(item.quality, 80)
  end

  def test_backstage_passes_quality_increases_by_2
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 0)]
    GildedRose.new(items).update_quality

    assert_equal(items.first.quality, 2)
  end

  def test_backstage_passes_quality_increases_by_3
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 0)]
    GildedRose.new(items).update_quality

    assert_equal(items.first.quality, 3)
  end

  def test_backstage_passes_quality_drops_to_0
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 50)]
    GildedRose.new(items).update_quality

    assert_equal(items.first.quality, 0)
  end

  def test_conjured_quality_degrades_by_2
    items = [Item.new('Conjured', 1, 2)]
    GildedRose.new(items).update_quality

    assert_equal(items.first.quality, 0)
  end

  def test_conjured_quality_degrades_by_4
    items = [Item.new('Conjured', 0, 4)]
    GildedRose.new(items).update_quality

    assert_equal(items.first.quality, 0)
  end
end
