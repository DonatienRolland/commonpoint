class PointsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy, :new, :create]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @user = current_user
    @points = @user.points

  end

  def show
  end

  def new
    @type = params[:param]
    @point = Point.new

    @activities = []
    @user.user_activities.map do |act|
      @activities << act.activity
    end

  end

  def create
    user_activity = UserActivity.where(user_id: @user.id).where(activity_id: activity_params)
    @point = Point.new(point_params)
    @point.user_activity = user_activity.first
    @point.user = @user
      raise
    if @point.save
      flash[:success] = "Votre point a été créé!"
      redirect_to user_point_path(@user, @point)
    else
      render 'new'
    end
  end

private

  def set_user
    @user = User.find(params[:user_id])
    authorize @user
  end

  def activity_params
    params[:point][:user_activity].to_i
  end

  def point_params
    params.require(:point).permit(:number_min, :number_max, :level_min, :price)
  end

end
