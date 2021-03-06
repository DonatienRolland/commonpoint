class PointsController < ApplicationController
  before_action :set_user, only: [ :new, :create, :home, :historique]
  before_action :set_onglet, only: [ :home, :historique]
  skip_before_action :authenticate_user!, only: [:index]
  skip_before_action :verify_authenticity_token, only: [:search_map, :update_materiel]

  def home
    participants = @user.participants
    points_selected_user(participants, @user)
    @points = @point_selected
    filtering(@points)
    @path_select_date = home_user_points_path(@user)
    @months = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  end

  def historique
    participants = Participant.where(user: @user, invited: true)
    points_selected_user(participants, @user)
    @points = @point_selected.where('date <= ?', @today)
    filtering(@points)
    @path_select_date = historique_user_points_path(@user)
    @months = [ -1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11]
  end

  def update
    @user = current_user
    @point = Point.find(params[:id])
    # raise
    if @point.update(point_params)
      if @point.verif_data
        # create a new point if second date
        if !params[:second_date].nil? && params[:second_date] != ""
          create_a_second_point_with(params[:second_date], @point)
        end
        if !@point.point_group.nil?
          @point_group = @point.point_group
          redirect_to point_group_path( @point_group ), flash: {notice: "Tout est en ordre"}
        else
          redirect_to point_path( @point ), flash: {notice: "Tout est en ordre"}
        end
      else
        redirect_to edit_point_path(@point), flash: {notice: @point.send_error_message }
      end
    else
      session[:point_test_id] = 345
      redirect_to edit_point_path(@point), flash: {notice: "Assurez vous d'avoir bien remplis tous les champs" }
    end
    authorize @user
  end

  def show
    # @session = session[:point_test_id]

    @user = current_user
    @point = Point.find(params[:id])

    @markers = { lat: @point.latitude, lng: @point.longitude }

    @participants_invited = Participant.invited_to(@point).order_by_user_name
    @participants_are_coming = Participant.is_comming_to(@point).order_by_user_name
    # @participants = Participant.is_comming_to(@point).order_by_user_name
    # raise
    @user_participant = Participant.where(user: @user, point: @point).first
    @equipments = @point.equipments

    @message = Message.new
    @points = Message.where(point: @point).order('created_at ASC')
    authorize @user
  end

  def edit
    @user = current_user
    @point = Point.find(params[:id])

    if @point.address.present?
      @markers = { lat: @point.latitude, lng: @point.longitude }
    else
      @markers = { lat: @user.company.latitude, lng: @user.company.longitude }
    end

    # participant part
    @stars = [0, 1, 2, 3, 4, 5, "all"]

    if params[:query] && params[:query] != ""
      @participants = @point.participants.search_by_first_name(params[:query])
    else
      @participants = @point.participants
    end

    if @point.participants.count == 0
      1.times { @point.participants.build }
    else
      0.times { @point.participants.build }
    end

    # equipment part
    @point.equipments.count == 0 ? 1.times { @point.equipments.build } : 0.times { @point.equipments.build }

    authorize @user
  end

  def create
    @point = Point.new(point_params)
    user_activity = UserActivity.where(user: @user).where(activity_id: activity_params)
    @point.user_activity = user_activity.first
    @point.user = @user
    if @point.save
      @point.generate_participants(@user)
      redirect_to edit_point_path(@point), flash: {notice: "Votre Point a été créé. Veuilliez compléter les infos manquantes"}
    else
      render new
    end
  end

  def destroy
    @point = Point.find(params[:id])
    @user = @point.user
    @point.destroy
    redirect_to home_user_points_path(@user)
    authorize @user
  end

  def update_type_of_point
    @user = current_user
    @point = Point.find(params[:id])
    activity_params = params.require(:point).permit(:type_of_point)

    if @point.update(activity_params)
    # le point passe de publique a prive
      @point.participants.where.not(user: @user).each do |participant|
      # desinviter tout les participants sauf le user
        if @point.is_public?
          participant.invited = true
        else
          participant.invited = nil
        end
        participant.save
      end
      redirect_to edit_point_path(@point)
    else
      raise
    end
    authorize @user
  end

  def search_map
    @user = current_user
    @point = Point.find(params[:params_value][:point])
    if @point.update(address:params[:params_value][:value])
      p "#{@point.address} after"
    else
      p 'error'
    end
    head :ok
    authorize @user
  end

  def update_materiel
    @point = Point.find(params[:id])
    params_value = params[:params_value]
    equipment = Equipment.find(params_value[:equipment])
    @user = User.find(params_value[:user])
    p "Is it checked? #{params_value[:checked]}"
    if params_value[:checked] == "true"
      p "ok you are checked"
      participant = Participant.where(user: @user, point: @point).first
    else
      p "ok unchecked"
      participant == nil
    end
      p "#{participant}"
    if equipment.update(participant: participant)
      p "All good dude"
    else
      p "error"
    end
    head :ok
    authorize @user
  end


private

  # def generate_participants(point, user)
  #   user_participant = Participant.create!(user: user, point: point, invited: true, status: "I'm in")
  #   activity = point.user_activity.activity
  #   user_activities = UserActivity.where(activity: activity)
  #   user_activities.each do |user_activity|
  #     if user_activity.user != user
  #       participant = Participant.create!( user:user_activity.user, invited: point.is_public? ? true : nil, point: point)
  #       participant.save
  #     end
  #   end
  # end

  def set_user
    @user = User.find(params[:user_id])
    authorize @user
  end

  def set_onglet
    @point = Point.new
    @now = Time.zone.now.beginning_of_month
  end

  def activity_params
    params[:point][:user_activity].to_i
  end

  def participants_and_equipments_prams
    params.require(:point).permit(
      participants_attributes: [ :status, :user_id, :invited ],
      equipments_attributes: [ :title ]
    )
  end

  def point_params
    params.require(:point).permit(:type_of_point, :number_min, :number_max, :level_min, :level_max, :price, :address, :date, :date2,
    # participants_attributes: [ :id, :status, :user_id ]
      participants_attributes: Participant.attribute_names.map(&:to_sym).push(:_destroy),
    # equipments_attributes: [ :id, :title ]
      equipments_attributes: Equipment.attribute_names.map(&:to_sym).push(:_destroy)
    )
  end

  def points_selected_user(participants, user)
    @user_points = []
    @address = []
    point_ids = []
    participants.each do |participant|
      point = participant.point
      point_ids << point.id
      address = participant.point.address
      if !@address.include?(participant.point.address)
        @user_points << point
        @address << point.address
      end
    end
    @today = Date.today
    @point_selected = Point.joins(:participants).where(participants:{ point_id: point_ids, user: user, invited: true}).order('date ASC')
  end

  def filtering(points)
    filtering_params(params).each do |key, value|
      @points = @points.public_send(key, value) if value.present? && value != "Tous"
    end
  end

  def filtering_params(params)
    params.slice(:addresses, :dates, :activity_title)
  end

  def create_a_second_point_with(params, point)
    new_point = Point.new(point.attributes.merge(date: params ))
    new_point.id = nil
    # # join to a group
    if point.point_group
      @point_group = point.point_group
    else
      @point_group = PointGroup.create!
      point.point_group = @point_group
    end
    point.save
    new_point.point_group = @point_group
    new_point.save
    # create its paerticipants and equipments
    point.participants.each do |participant|
      part = Participant.create(participant.attributes.merge(id: nil, point: new_point))
    end
    point.equipments.each do |equipment|
      equi = Equipment.create(equipment.attributes.merge(id: nil, point: new_point))
    end
  end

end
