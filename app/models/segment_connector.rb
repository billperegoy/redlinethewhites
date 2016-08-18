class SegmentConnector < ActiveRecord::Base
  belongs_to :user
  belongs_to :trail_segment


  def self.matching_id(user:, segment:)
    segment = SegmentConnector.find_by(trail_segment_id: segment.id, user_id: user.id)
    if segment
      segment.id
    else
      nil
    end
  end
end
