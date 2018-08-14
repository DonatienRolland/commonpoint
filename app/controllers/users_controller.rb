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

    authorize @user
  end
end
