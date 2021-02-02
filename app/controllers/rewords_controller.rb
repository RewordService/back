class RewordsController < ApplicationController
  before_action :authenticate_user!, only: %i(update)

  def info
    total_score = Reword.all.sum(:total)
    success_score = Reword.all.sum(:score)
    success_rate = total_score > 0 ? ((success_score / total_score).to_f * 100).floor(1) : 0
    render json: { total_score: total_score, success_rate: success_rate }
  end

  def update
    current_user.reword.increment!(:total)
    current_user.reword.increment!(:score)
    current_user.reword[params[:count]]['total'] += 1
    case params[:result]
    when "success"
      current_user.reword.increment!(:total)
      current_user.reword[params[:count]]['success'] += 1
      current_user.reword[:score] += params[:count].to_i
    when "fail"
    end
    current_user.reword.save
  end
end
