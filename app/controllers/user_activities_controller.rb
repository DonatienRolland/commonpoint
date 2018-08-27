class UserActivitiesController < ApplicationController
  def create
    if params[:search_bar]
      raise
    end
    @user = User.find(params[:user_id])
    @user_activity = UserActivity.new(activity_params)
    @user_activity.user = @user
    if @user_activity.save
      respond_to do |format|
        format.html { redirect_to user_activities_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'users/show/user_activities' }
        format.js
      end
    end

    authorize @user

  end

  def update
    @user_activity = UserActivity.find(params[:id])
    @user = @user_activity.user
    if @user_activity.update(activity_params)
      redirect_to user_activities_path
    else
      render new
    end
    authorize @user_activity
  end


  def destroy
    @user_activity = UserActivity.find(params[:id])
    @user = @user_activity.user
    @user_activity.destroy
    respond_to do |format|
      format.html { redirect_to user_activities_path }
      format.js
    end
    authorize @user_activity
  end

  def index

    @user = current_user
    @categories = Category.all
    if params[:query] && params[:query] != ""
      @activities = Activity.search_by_title(params[:query])
    else
      @activities = Activity.all
    end



    numbers = []
    Activity.all.each do |activity|
      numbers << activity.number_of_user
    end
    @max_max = numbers.max(10)

    @user_activity = UserActivity.new

    user_activities = policy_scope(UserActivity)
    authorize UserActivity
  end

  private

  def activity_params
    params.require(:user_activity).permit(:level, :description, :activity_id)
  end
end

