class UsersController < ApplicationController

  before_filter :check_user_login, :only => [:index, :new, :create, :sessions]
  before_filter :authenticate_user, :only => [:show]
  before_filter :set_no_cache

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user=User.new(params[:user])
    #@user = User.create( params[:user] )
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user=User.find(params[:id])
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes params[:user]
      redirect_to @user, :notice => "Successfully updated"
    else
      render :show
    end
  end

  def set_no_cache
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "0"
  end



end
