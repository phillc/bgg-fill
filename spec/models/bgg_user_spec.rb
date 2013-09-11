require 'spec_helper'

describe BggUser do
  describe "#collection" do
    it "does something" do
      bgg_user = BggUser.new(username: "phillc")

      VCR.use_cassette('bgg_user_phillc') do
        bgg_user.collection
      end
    end

  end
end
