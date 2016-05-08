class CommentsController < ApplicationController
  def index
    post = Post.find(params[:post_id])
    comments = post.comments
    respond_with comments
  end
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.create(comment_params)
    respond_with post, comment
  end

  def upvote
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    comment.incremment!(:upvotes)

    respond_with post, comment
  end


  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
