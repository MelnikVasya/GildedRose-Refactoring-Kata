class BackstageItem < Item
  def update_quality
    self.sell_in -= DEFAULT_DECREASE_SELL_IN

    return self.quality = 0 if sell_in < 0
    return if quality >= MAX_QUALITY

    self.quality += DEFAULT_DECREASE_QUALITY
    self.quality += DEFAULT_DECREASE_QUALITY if sell_in < 10
    self.quality += DEFAULT_DECREASE_QUALITY if sell_in < 5
  end
end
