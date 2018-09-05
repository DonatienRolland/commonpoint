class PointGroupsController < ApplicationController
  def show
    @user = current_user
    @point_group = PointGroup.find(params[:id])

    authorize @user
  end


end
