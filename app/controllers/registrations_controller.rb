class RegistrationsController <  Devise::RegistrationsController

  respond_to :json

  def create

    user = User.new(sign_up_params)
    if user.save
      render :json=> user.as_json(:auth_token=>user.authentication_token, :email=>user.email), :status=>201
      return
    else
      warden.custom_failure!
      render :json=> user.errors, :status=>422
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end


end