require 'spec_helper'

describe BggUser do
  describe "#collection" do
    it "does something" do
      bgg_user = BggUser.new(username: "phillc")

      collection = VCR.use_cassette('bgg_user_phillc') do
        bgg_user.collection
      end

      expect(collection).to have(36).items
      expect(collection.first.name).to eq("7 Wonders")
    end
  end
end
