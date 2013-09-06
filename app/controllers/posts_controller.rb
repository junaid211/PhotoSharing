class PostsController < ApplicationController

  def index
    #@show_post=Post.where(group_id: params[:post][:group_id])

  end

  def new
    @post=Post.new
    @show_post=Post.where(group_id: params[:post][:group_id])
  end
  def create
    @post=Post.new(params[:post])
    @post.errors
    if @post.save
      redirect_to @post#post_path(params[:post][:group_id])
    else
      render "posts/new"
    end

  end
  def show
    @post=Post.where(group_id: params[:id])
    #@show_post=Post.where(group_id: params[:group_id])
    7.times { |i| logger.debug "*****#{ @post.inspect if i == 4 }*****" }
  end
  def show_posts

  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to post_path
  end
end
