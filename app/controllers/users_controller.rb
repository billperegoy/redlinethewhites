class UsersController < Clearance::UsersController
  def show
    @user = User.find(1)
  end
end
