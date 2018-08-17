class UserActivitiesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user_activity = UserActivity.new(activity_params)
    @user_activity.user = @user
    raise
    if @user_activity.save
      respond_to do |format|
        format.html { redirect_to user_user_activities_path(@user) }
        format.js do
          render 'users/show/user_activities', content_type: 'text/javascript'
        end
      end
    else
      raise
      respond_to do |format|
        format.html { render 'users/show/user_activities' }
        format.js do
          render 'users/show/user_activities', content_type: 'text/javascript'
        end
      end
    end

    authorize @user

  end
  def destroy
    raise

  end

  def index
    @user = User.find(params[:user_id])
    @categories = Category.all
    @user_activity = UserActivity.new

    @user_activities = policy_scope(UserActivity)
    authorize UserActivity
  end

  private

  def activity_params
    params.require(:user_activity).permit(:level, :description, :activity_id)
  end
end

