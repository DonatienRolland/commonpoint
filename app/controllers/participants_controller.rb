class ParticipantsController < ApplicationController
  def update
    @participant = Participant.find(params[:id])
    @user = current_user
    @point = @participant.point
    if params[:commit] == "I can't"
      @participant.status = "I can't"
      @participant.save
      redirect_to point_path(@point), flash: {notice: "Merci" }
    elsif params[:commit] == "I'm in"
      @participant.status = "I'm in"
      @participant.save
      redirect_to point_path(@point), flash: {notice: "Merci" }
    else
      redirect_to point_path(@point), flash: {notice: "Something wrong" }
    end
     authorize @user
  end
end
