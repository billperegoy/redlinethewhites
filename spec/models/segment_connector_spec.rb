require 'rails_helper'

RSpec.describe SegmentConnector, type: :model do
  it "can asssociate different users with different segments" do
    user1 = User.create(email: "user1@example.com", password: "hello")
    user2 = User.create(email: "user2@example.com", password: "hello")

    segment1 = TrailSegment.create(start: "p1", end: "p2", distance: 1.0)
    segment2 = TrailSegment.create(start: "p3", end: "p4", distance: 2.0)
    segment3 = TrailSegment.create(start: "p5", end: "p6", distance: 3.0)
    segment4 = TrailSegment.create(start: "p7", end: "p8", distance: 4.0)

    SegmentConnector.create(user_id: user1.id, trail_segment_id: segment1.id)
    SegmentConnector.create(user_id: user1.id, trail_segment_id: segment2.id)

    SegmentConnector.create(user_id: user2.id, trail_segment_id: segment2.id)
    SegmentConnector.create(user_id: user2.id, trail_segment_id: segment3.id)
    SegmentConnector.create(user_id: user2.id, trail_segment_id: segment4.id)

    expect(user1.trail_segments.count).to eq(2)
    expect(user2.trail_segments.count).to eq(3)
  end
end
