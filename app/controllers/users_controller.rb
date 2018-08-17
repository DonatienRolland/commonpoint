class UsersController < ApplicationController

  def activities
    @user = User.find(params[:id])
    @categories = Category.all

    @art = Category.where(title: "Arts").first
    @art_activities = Activity.where(category_id: @art.id)

    @sport = Category.where(title: "Sport").first
    @sport_activities = Activity.where(category_id: @sport.id)

    @culture = Category.where(title: "Culture").first
    @culture_activities = Activity.where(category_id: @culture.id)

    @user_activity = UserActivity.new

    @user.user_activities.build

    @points = @user.points

    @user_activities = UserActivity.where(user: @user)

    id_act = []
    @art_activities.each do |act|
      id_act << act.id
    end
    @art_user_activities = []
    @user_activities.each do |act|
      if id_act.include?act.activity_id
        @art_user_activities << act
      end
    end



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
