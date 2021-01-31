class ProfilesController < ApplicationController
  def show
    render json: User.find(params[:user_id]), include: :profile
  end
end
