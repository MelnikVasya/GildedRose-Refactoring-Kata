class ConjuredItem < Item
  def update_quality
    decrease_quality = DEFAULT_DECREASE_QUALITY * 2

    self.sell_in -= DEFAULT_DECREASE_SELL_IN
    self.quality -= decrease_quality
    self.quality -= decrease_quality if sell_in < 0
  end
end
