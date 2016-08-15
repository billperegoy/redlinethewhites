class TrailSegment < ActiveRecord::Base
  belongs_to :trail
  has_many :segment_connectors
  has_many :users, through: :segment_connectors
end
