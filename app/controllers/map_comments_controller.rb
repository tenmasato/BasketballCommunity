class MapCommentsController < ApplicationController
  def create
    map = Map.find(params[:map_id])
    map_comment = current_user.map_comments.new(map_comment_params)
    map_comment.map_id = map.id
    map_comment.save
    redirect_to request.referer
  end

  def destroy
    MapComment.find_by(id: params[:id]).destroy
    redirect_to request.referer
  end

  private

  def map_comment_params
    params.require(:map_comment).permit(:comment)
  end
end
