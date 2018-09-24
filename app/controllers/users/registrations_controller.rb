class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end
  def create
    @user = User.new(user_params)
    @user.email_company
    if @user.has_company?
      if @user.save
        sign_up(resource)
      else
        render :new
      end
    else
      flash[:notice] = "Votre adresse mail n'est pas valide"
      render :new
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def sign_up(resource)
    sign_in(resource)
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:first_name, :email, :password, :password_confirmation, :avatar, :last_name, :phone)
  end
end
