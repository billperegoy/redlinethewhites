require 'rails_helper'

RSpec.describe Region, type: :model do
  it "should allow a region to be created" do
    Region.create(name: "Franconia Area")
    expect(Region.count).to eq(1)
  end

  it "should allow multiple regions to be created" do
    Region.create(name: "Franconia Area")
    Region.create(name: "Mt. Washington Vicinity")
    expect(Region.count).to eq(2)
  end
end
