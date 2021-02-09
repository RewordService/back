class RewordsController < ApplicationController
  before_action :authenticate_user!, only: %i(update show)
  before_action :set_game_info, only: %i(update show)

  def info
    total_score = Reword.all.sum(:total)
    success_score = Reword.all.sum(:success)
    success_rate = total_score > 0 ? (success_score / total_score.to_f * 100).floor(1) : 0
    render json: { total_score: total_score, success_rate: success_rate }
  end

  def show
    render json: @game_info
  end

  def update
    current_user.reword.increment!(:total)
    current_user.reword.increment!(:score)
    current_user.reword[params[:count]]['total'] += 1
    case params[:result]
    when "success"
      current_user.reword.increment!(:success)
      current_user.reword[params[:count]]['success'] += 1
      current_user.reword[:score] += params[:count].to_i
    when "fail"
    end
    current_user.reword.save

    render json: @game_info
  end
  def set_game_info
    @game_info = {score: current_user.reword.score, ranking: Reword.all.order(score: :desc).index(current_user.reword)}
  end
end
