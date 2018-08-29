class MessagesController < ApplicationController
  def create
    @point = Point.find(params[:point_id])
    @user = current_user
    participant = Participant.where(user: @user, point: @point)
    @participant = participant.first
    @message = Message.new(message_params)
    @message.point = @point
    @message.participant = @participant
    if @message.save
      respond_to do |format|
        format.html { redirect_to point_path(@point) }
        format.js  # <-- will render `app/views/messages/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'points/show' }
        format.js  # <-- idem
      end
    end
     authorize @user
  end


  private

  def message_params
    params.require(:message).permit(:content)
  end
end
