
class ProfilesController < ApplicationController
  before_action :set_user,only: %i[edit update]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path
    end
  end

  private
  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email,:username,:profile,:avatar)
  end

end

