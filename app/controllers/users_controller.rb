class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])

    authorize @user
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "User information updated!"
      redirect_to edit_user_path(@user)
    else
      raise
    end
    authorize @user
  end

private

  def user_params
    params.require(:user).permit(:first_name, :avatar, :last_name, :phone)
  end
end
