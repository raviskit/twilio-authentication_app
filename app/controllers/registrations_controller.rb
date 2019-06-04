class RegistrationsController < Devise::RegistrationsController
  def show
    @user = User.find params[:id]
  end
  private
  def sign_up_params
    # some more added to user table this makes them available to user table
    params.require(:user).permit(:email, :password, :password_confirmation, :phone_number, :country_code)
  end

end
