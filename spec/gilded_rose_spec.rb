require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("Pocket Watch", 10, 30)]
      GildedRose.new(items).update_quality()
      expect( items[0].name ).to eq( "Pocket Watch" )
    end

    it "does change the quality" do
      items = [Item.new("Pocket Watch", 10, 30)]
      expect{ GildedRose.new(items).update_quality() }.to change{ items[0].quality }
    end

    it "degrades the quality twice as fast if sell by date has passed" do
      items = [Item.new("Pocket Watch", -2, 30)]
      GildedRose.new(items).update_quality()
      expect( items[0].quality ).to eq( 28 )
    end

    it "does not degrade the quality to less than zero" do
      items = [Item.new("Pocket Watch", -2, 30)]
      store = GildedRose.new(items)
      16.times do
        store.update_quality()
      end
      expect( items[0].quality ).not_to eq( -2 )
    end
  end

end
