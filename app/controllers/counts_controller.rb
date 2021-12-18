class CountsController < ApplicationController
  before_action :authenticate_user!

  def create
    @map = Map.find(params[:map_id])
    count = @map.counts.new(user_id: current_user.id)
    if count.save
    redirect_to request.referer,notice: "コートにはいりました。バスケを楽しんで!!"
    end
  end

  def destroy
    @map = Map.find(params[:map_id])
    count = @map.counts.find_by(user_id: current_user.id)
    count.destroy
    redirect_to request.referer,notice: "コートをでました"
  end
end
