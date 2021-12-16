class MapsController < ApplicationController
  def index
    @maps = Map.all
  end

  def show
    @map = Map.find(params[:id])
    @map_comment = MapComment.new
  end

  def mypage
     @bookmarks = Bookmark.where(user_id: current_user.id)
  end

end
