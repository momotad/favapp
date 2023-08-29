class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      bypass_sign_in(current_user)
      redirect_to '/'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
