class RewordsController < ApplicationController
  before_action :authenticate_user!, only: %i(update)

  def info
    total_score = Reword.all.sum(:total)
  end

  def update
    current_user.reword.increment!(:total)
    current_user.reword.increment!(:score)
    current_user.reword[params[:count]]['total']+=1
    case params[:result]
    when "success"
      current_user.reword.increment!(:total)
      current_user.reword[params[:count]]['success']+=1
      current_user.reword[:score] += params[:count].to_i
    when "fail"
    end
    current_user.reword.save
  end
end
