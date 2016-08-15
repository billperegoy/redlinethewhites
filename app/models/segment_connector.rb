class SegmentConnector < ActiveRecord::Base
  belongs_to :user
  belongs_to :trail_segment
end
