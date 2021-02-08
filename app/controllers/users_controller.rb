class UsersController < ApplicationController
  def index
    render json: User.ransack(JSON.parse(params[:q])).result
  end

  def show
    render json: User.find(params[:id]), include: :reword
  end

  def latest
    render json: User.order(created_at: :desc).limit(10)
  end

  def ranked
    render json: User.find(Reword.group(:id).order(score: :desc).limit(5).pluck(:user_id))
  end

  def user_params
    params.require(:q).permit(:name_cont)
  end
end
