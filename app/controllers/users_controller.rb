class UsersController < Clearance::UsersController
  def show
    @user = User.find(current_user.id)
    @regions = Region.all
  end

  def url_after_create
    "/users/#{current_user.id}"
  end
end
