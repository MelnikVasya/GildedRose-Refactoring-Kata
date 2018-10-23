require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'test/unit'

class TestUntitled < Test::Unit::TestCase
  def test_lowers_quality_and_sell_in_by_1
    item = GildedRose.for('name', 1, 1)
    item.update_quality

    assert_equal(0, item.sell_in)
    assert_equal(0, item.quality)
  end

  def test_if_sell_date_passed_quality_degrades_twice
    item = GildedRose.for('name', 0, 2)
    item.update_quality

    assert_equal(0, item.quality)
  end

  def test_quality_cant_be_negative
    item = GildedRose.for('name', 0, 0)
    item.update_quality

    assert(!item.quality.negative?)
  end

  def test_aged_brie_quality_increases_by_1
    item = GildedRose.for('Aged Brie', 1, 0)
    item.update_quality

    assert_equal(1, item.quality)
  end

  def test_aged_brie_quality_increases_by_2
    item = GildedRose.for('Aged Brie', 0, 0)
    item.update_quality

    assert_equal(2, item.quality)
  end

  def test_quality_cannot_increase_more_than_50
    item = GildedRose.for('Aged Brie', 0, 50)
    item.update_quality

    assert_equal(50, item.quality)
  end

  def test_sulfuras_dont_change_quality_and_sell_in
    item = GildedRose.for('Sulfuras', 1, 80)
    item.update_quality

    assert_equal(1, item.sell_in)
    assert_equal(80, item.quality)
  end

  def test_backstage_passes_quality_increases_by_2
    item = GildedRose.for('Backstage', 10, 0)
    item.update_quality

    assert_equal(2, item.quality)
  end

  def test_backstage_passes_quality_increases_by_3
    item = GildedRose.for('Backstage', 5, 0)
    item.update_quality

    assert_equal(3, item.quality)
  end

  def test_backstage_passes_quality_drops_to_0
    item = GildedRose.for('Backstage', 0, 50)
    item.update_quality

    assert_equal(0, item.quality)
  end

  def test_conjured_quality_degrades_by_2
    item = GildedRose.for('Conjured', 1, 2)
    item.update_quality

    assert_equal(0, item.quality)
  end

  def test_conjured_quality_degrades_by_4
    item = GildedRose.for('Conjured', 0, 4)
    item.update_quality

    assert_equal(0, item.quality)
  end
end
