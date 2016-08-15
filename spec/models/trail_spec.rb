require 'rails_helper'

RSpec.describe Trail, type: :model do
  it "should allow a trail to be created" do
    Trail.create(name: "Falling Waters")
    expect(Trail.count).to eq(1)
  end

  it "should allow multiple trails to be created" do
    Trail.create(name: "Falling Waters")
    Trail.create(name: "Old Bridle Path")
    expect(Trail.count).to eq(2)
  end

  it "should properly associate regions and trails" do
    region = Region.create(name: "Franconia Area")
    trail1 = Trail.create(name: "Falling Waters", region_id: region.id)
    trail2 = Trail.create(name: "Old Bridle Path", region_id: region.id)
    expect(region.trails.count).to eq(2)
    expect(trail1.region.name).to eq("Franconia Area")
    expect(trail2.region.name).to eq("Franconia Area")
  end
end
