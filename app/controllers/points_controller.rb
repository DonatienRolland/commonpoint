class PointsController < ApplicationController
  def show
  end

  def new
    @user = User.find(params[:user_id])
    @point = Point.new
    authorize @user
  end
end
