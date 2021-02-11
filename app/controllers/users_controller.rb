class UsersController < ApplicationController
  def index
    paginate json: User.ransack(
      params[:q].is_a?(String) ? JSON.parse(params[:q]) : params[:q]
    ).result
  end

  def show
    render json: User.find(params[:id]), include: :reword
  end

  def latest
    paginate json: User.order(created_at: :desc)
  end

  def ranked
    paginate json: User.find(Reword.group(:id).order(score: :desc).pluck(:user_id))
  end

  def user_params
    params.require(:q).permit(:name_cont)
  end
end
