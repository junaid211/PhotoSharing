class CommentsController < ApplicationController
  def new
    @post, @comment = Post.find(params[:post_id]), Comment.new
  end
  def create
    @post = Post.find(params[:post_id])
    @comment=Comment.new(params[:comment])
    @comment.post = @post
    if @comment.save
      redirect_to @comment.post
    else
      render :new
    end

  end
end
