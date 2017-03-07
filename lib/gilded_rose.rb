require './lib/item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      change_sell_in(item, -1) unless is_sulfuras?(item)

      if !is_aged_brie?(item) and !is_backstage_pass?(item)
        if !is_sulfuras?(item)
          change_quality(item, - 1)
        end
      else
        change_quality(item, 1)
        if is_backstage_pass?(item)
          if item.sell_in < 11
              change_quality(item, 1)
          end
          if item.sell_in < 6
              change_quality(item, 1)
          end
        end
      end
      if item.sell_in < 0
        if !is_aged_brie?(item)
          if !is_backstage_pass?(item)
            if !is_sulfuras?(item)
              change_quality(item, - 1)
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          change_quality(item, 1)
        end
      end
    end
  end

  private

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
    item.quality > 0 && item.quality < 50
  end
end
