class UsersController < ApplicationController

  def activities
    @user = User.find(params[:id])
    @categories = Category.all
    @user_activity = UserActivity.new
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to activities_user_path(@user)
    else
      raise
    end
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(
      user_activities_attributes: [:id, :level, :activity_id, :description]
      )
  end
end
