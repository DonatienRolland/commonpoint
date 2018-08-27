class PointsController < ApplicationController
  before_action :set_user, only: [ :new, :create, :home]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @user = current_user
    @points = @user.points

    user = policy_scope(User)
    authorize User
  end

  def update
    @user = current_user
    @point = Point.find(params[:id])

    if @point.update(point_params)
      if @point.verif_data
        redirect_to point_path(@point), flash: {notice: "Votre Point a été créé avec succès"}
      else
        redirect_to edit_point_path(@point), flash: {notice: @point.send_error_message }
      end
    else
      render new
    end
    authorize @user
  end

  def show
    @user = current_user
    @point = Point.find(params[:id])
    authorize @user
  end

  def edit
    @user = current_user
    @point = Point.find(params[:id])

    activity = @point.user_activity.activity
    user_activities = UserActivity.where(activity: activity)

    @participants = []
    user_activities.each do |user_activity|
      if !@participants.include?(user_activity.user)
        @participants << participant = user_activity.user
      end
    end
    # @point.participants.build
    # @participant = Participant.new

    if @point.participants.count == 0
      1.times { @point.participants.build }
    else
      0.times { @point.participants.build }
    end
    authorize @user
  end

  def create
    @point = Point.new(point_params)
    user_activity = UserActivity.where(user: @user).where(activity_id: activity_params)
    @point.user_activity = user_activity.first
    @point.user = @user
    if @point.save
      activity = @point.user_activity.activity
      user_activities = UserActivity.where(activity: activity)

      user_activities.each do |user_activity|
        participant = Participant.create!( user:user_activity.user, invited: false, point: @point)
        participant.save
      end
      redirect_to edit_point_path(@point), flash: {notice: "Votre Point a été créé. Veuilliez compléter les infos manquantes"}
    else
      render new
      raise
    end
  end

  def home
    @points = @user.points
    @point = Point.new
    @activities = []
    @user.user_activities.map do |act|
      @activities << act.activity
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
    params.require(:point).permit(:type_of_point, :number_min, :number_max, :level_min, :price, :address,
      # participants_attributes: [ :id, :status, :user_id ]
      participants_attributes: Participant.attribute_names.map(&:to_sym).push(:_destroy)
      )
  end
end
