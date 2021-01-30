class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def latest
    render json: User.all.order(:id)
  end

  def ranked
    render json: User.all
  end
end
