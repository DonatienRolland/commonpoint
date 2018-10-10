class UserActivitiesController < ApplicationController
  def create
    if params[:search_bar]
      raise
    end
    @user = User.find(params[:user_id])
    @user_activity = UserActivity.new(activity_params)
    @user_activity.user = @user
    if @user_activity.save
      act = @user_activity.activity.title
      points = Point.activity_title(act).where('type_of_point = ? and date <= ?', "Publique", DateTime.now).where(full: false)
      points.each do |point|
        Participant.create(point: point, user: @user, invited: true)
      end
      redirect_to user_activities_path
    else
      render :index
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

  def new
    @user = current_user
    if params[:act]
      @act_id = params[:act]
      @activity = Activity.find(@act_id)
      @random = params[:random]
      @user_activity =  UserActivity.where(user: @user, activity_id: @act_id ).first
    end
    respond_to do |format|
      format.html
      format.js
    end
    authorize @user
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
    @max_max = numbers.max(4)

    @user_activity = UserActivity.new






    user_activities = policy_scope(UserActivity)
    authorize UserActivity
  end

  def search
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
    @max_max = numbers.max(4)

    @user_activity = UserActivity.new

    respond_to do |format|
      format.html
      format.js
    end
    authorize @user
  end

  private

  def activity_params
    params.require(:user_activity).permit(:level, :description, :activity_id)
  end
end

