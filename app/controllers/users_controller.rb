class UsersController < ApplicationController

  def update
    # @user = User.find(params[:id])
    # if @user.update(user_params)
    #   redirect_to activities_user_path(@user)
    # else
    #   raise
    # end
    # authorize @user
  end

  private

  def user_params
    params.require(:user).permit(
      user_activities_attributes: [:id, :level, :activity_id, :description]
      )
  end
end
