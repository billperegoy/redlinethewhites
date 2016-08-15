class User < ActiveRecord::Base
  include Clearance::User

  has_many :segment_connectors
  has_many :trail_segments, through: :segment_connectors
  after_initialize :init

  def init
    self.admin  ||=  false
  end
end
