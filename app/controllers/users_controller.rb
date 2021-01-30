class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
  end

  def latest
  end

  def ranked
  end
end
