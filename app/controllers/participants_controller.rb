class ParticipantsController < ApplicationController
  def update
    @participant = Participant.find(params[:id])
    @user = current_user
    @point = @participant.point
    if @participant.update(participant_params)
      if @point.is_validated?
        @point.full = true
        @point.save
      end
      redirect_to point_path(@point), flash: {notice: "Merci" }
    else
      redirect_to point_path(@point), flash: {notice: "Something wrong" }
    end
    authorize @user
  end

  def participant_params
    params.require(:participant).permit(:status)
  end
end
