class UsersController < ApplicationController
  def index
    render json: User.ransack(params[:q]).result.page(params[:page])
  end

  def show
    render json: User.find(params[:id]), include: :profile
  end

  def latest
    render json: User.all.order(:id)
  end

  def ranked
    render json: User.all
  end

  def user_params
    params.require(:q).permit(:name_cont)
  end
end
