class UsersController < Clearance::UsersController

  private

  def user_params
    params.require(:user).permit(:avatar, :username, :email, :password)
  end

end