require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("Pocket Watch", 10, 30)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Pocket Watch"
    end
  end

end
