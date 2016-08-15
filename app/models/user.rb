class User < ActiveRecord::Base
  include Clearance::User

  after_initialize :init

  def init
    self.admin  ||=  false
  end
end
