class EquipmentsController < ApplicationController
  def update
    @equipment = Equipment.find(params[:id])
    @point = @equipment.point
    @user = current_user
    participant = Participant.where(point: @point, user: @user)
    @participant = participant.first
    if !@participant.nil?
      if !params[:equipment].nil? && equipment_params == "Je m'en occupe"
        @equipment.participant = @participant
      elsif params[:equipment].nil?
        @equipment.participant = nil
      else
        redirect_to point_path(@point)
      end
      if @equipment.save
        redirect_to point_path(@point), flash: {notice: "Merci" }
      else
        redirect_to point_path(@point), flash: {notice: @participant.validation_update(@point) }
      end
    else
      redirect_to point_path(@point), flash: {notice: "Désolé nous ne pouvons accèder à votre demande" }
    end
    authorize @user
  end


  private

  def equipment_params
    params[:equipment][:participant_id][1]
  end
end
