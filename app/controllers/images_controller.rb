class ImagesController < ApplicationController
  def new
    @image=Image.new
  end
  def create
    @image=Image.new(params[:image])
    if @image.save
      redirect_to @image
    else
      render 'images/new'
    end
  end
  def show
    @images=current_user.images
  end
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to image_path
  end
end
