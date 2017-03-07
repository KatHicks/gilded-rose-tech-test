require './lib/item'

class GildedRose

  LOWER_LIMIT = 0
  UPPER_LIMIT = 50

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      change_sell_in(item, -1) unless is_sulfuras?(item)
      change_quality(item, -1) unless is_special?(item)

      if is_special?(item)
        change_quality(item, 1)
        change_quality(item, 1) if is_backstage_pass?(item) && item.sell_in < 11
        change_quality(item, 1) if is_backstage_pass?(item) && item.sell_in < 6
      end

      if sell_in_passed?(item)
        change_quality(item, -1) unless is_special?(item)
        change_quality(item, 1) if is_aged_brie?(item)
        item.quality = LOWER_LIMIT if is_backstage_pass?(item) || is_sulfuras?(item)
      end

    end
  end

  private

  def is_special?(item)
    is_aged_brie?(item) || is_backstage_pass?(item) || is_sulfuras?(item)
  end

  def is_aged_brie?(item)
    item.name == "Aged Brie"
  end

  def is_sulfuras?(item)
    item.name == "Sulfuras, Hand of Ragnaros"
  end

  def is_backstage_pass?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def change_quality(item, value)
    if quality_within_range?(item)
      item.quality += value
    end
  end

  def change_sell_in(item, value)
    item.sell_in += value
  end

  def quality_within_range?(item)
    item.quality > LOWER_LIMIT && item.quality < UPPER_LIMIT
  end

  def sell_in_passed?(item)
    item.sell_in < LOWER_LIMIT
  end

end
