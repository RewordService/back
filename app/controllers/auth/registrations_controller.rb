class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  def sign_up_params
    params.permit(:name, :email, :password, :password_confirmation, :image, :introduction, :gender,
                  :birthday)
  end

  def account_update_params
    params.permit(:name, :email, :password, :password_confirmation, :image, :introduction, :gender,
                  :birthday)
  end
end
