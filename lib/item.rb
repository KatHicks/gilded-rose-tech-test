class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def is_aged_brie?
    self.name == "Aged Brie"
  end

  def is_sulfuras?
    self.name == "Sulfuras, Hand of Ragnaros"
  end

  def is_backstage_pass?
    self.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def update_quality(value)
    if quality_within_range?
      self.quality += value
    end
  end

  def update_sell_in(value)
    self.sell_in += value
  end

  def quality_within_range?
    self.quality > 0 && self.quality < 50
  end

end
