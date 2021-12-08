class TweetCommentsController < ApplicationController

  def create
    tweet = Tweet.find(params[:tweet_id])
    tweet_comment = current_user.tweet_comments.new(tweet_comment_params)
    tweet_comment.tweet_id = tweet.id
    tweet_comment.save
    redirect_to request.referer
  end

  def destroy
    TweetComment.find_by(id: params[:id]).destroy
    redirect_to request.referer
  end

  private

  def tweet_comment_params
    params.require(:tweet_comment).permit(:comment)
  end

end
