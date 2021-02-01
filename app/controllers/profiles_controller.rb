class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: %i(update)

  def update
    current_user.profile.update(profile_params)
    render json: current_user.profile
  end

  def profile_params
    params.permit(:gender, :introduction, :birthday)
  end
end
