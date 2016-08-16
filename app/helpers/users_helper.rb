module UsersHelper
  def this_segment_hiked?(segment:, user:)
    segment.users.map {|u| u.id}.include?(user.id)
  end
end
