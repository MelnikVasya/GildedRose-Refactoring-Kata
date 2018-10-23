class AgedBrieItem < Item
  def update_quality
    self.sell_in -= DEFAULT_DECREASE_SELL_IN

    return if quality >= MAX_QUALITY

    self.quality += DEFAULT_DECREASE_QUALITY
    self.quality += DEFAULT_DECREASE_QUALITY if sell_in < 0
  end
end
