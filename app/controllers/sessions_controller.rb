class SessionsController < Clearance::SessionsController
  def url_after_create
    "/users/#{current_user.id}"
  end

  def url_for_signed_in_users
    "/users/#{current_user.id}"
  end
end
