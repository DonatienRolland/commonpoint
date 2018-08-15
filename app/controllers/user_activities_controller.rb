class UserActivitiesController < ApplicationController
  def create
    @user = User.find(params[:user_id])

    @user_activity = @user.user_activities.build(activity_params)
    if @user_activity.save
      redirect_to activities_user_path(@user)
    else
      raise
    end
    authorize @user
  end

  private

  def activity_params
    params.require(:user_activity).permit(:level, :description, :activity_id)
  end
end
