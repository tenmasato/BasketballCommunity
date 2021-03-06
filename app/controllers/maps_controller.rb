class MapsController < ApplicationController
  before_action :authenticate_user!

  def index
    @maps = Map.all
  end

  def show
    @map = Map.find(params[:id])
    @map_comment = MapComment.new
    @counts = Count.where(map_id: @map.id)
    @map_comments = @map.map_comments.page(params[:page]).per(1)
  end

  def mypage
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end
end
