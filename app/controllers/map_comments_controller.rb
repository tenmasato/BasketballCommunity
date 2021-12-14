class MapCommentsController < ApplicationController

  def create
    map= Map.find(params[:tweet_id])
    map_comment = current_user.tweet_comments.new(map_comment_params)
    map_comment.tweet_id = map.id
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
