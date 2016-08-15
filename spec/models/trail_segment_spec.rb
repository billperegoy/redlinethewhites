require 'rails_helper'

RSpec.describe TrailSegment, type: :model do
  it "should allow a trail segment to be created" do
    TrailSegment.create(start: "Trail head", end: "Height of land", distance: 2.0)
    expect(TrailSegment.count).to eq(1)
  end

  it "should allow multiple trails to be created" do
    TrailSegment.create(start: "Trail head", end: "Height of land", distance: 2.0)
    TrailSegment.create(start: "Height of land", end: "Summit", distance: 1.0)
    expect(TrailSegment.count).to eq(2)
  end

  it "should properly associate regions and trails" do
    trail = Trail.create(name: "Old Bridle Path")
    segment1 = TrailSegment.create(start: "Trail head", end: "Height of land", distance: 2.0, trail_id: trail.id)
    segment2 = TrailSegment.create(start: "Height of land", end: "Summit", distance: 1.0, trail_id: trail.id)
    expect(trail.trail_segments.count).to eq(2)
    expect(segment1.trail.name).to eq("Old Bridle Path")
    expect(segment2.trail.name).to eq("Old Bridle Path")
  end
end
