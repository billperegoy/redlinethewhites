class Trail < ActiveRecord::Base
  belongs_to :region
  has_many :trail_segments
end
