class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @map = Map.find(params[:map_id])
    bookmark = @map.bookmarks.new(user_id: current_user.id)
    bookmark.save
  end

  def destroy
    @map = Map.find(params[:map_id])
    bookmark = @map.bookmarks.find_by(user_id: current_user.id)
    bookmark.destroy
  end
end
