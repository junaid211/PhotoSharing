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
    #7.times { |i| logger.debug "*****#{ @user.inspect if i == 4 }*****" }
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user=User.find(params[:id])
    @show_group=current_user.memberships
    @groups_own=current_user.owned_groups
    @user_posts=current_user.images
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
  def change_profile
    @user_profile=User.find(current_user)
    #render "users/change_profile"
  end

  def show_groups
    @show_group=current_user.memberships
    7.times { |i| logger.debug "*****#{ @show_group.inspect if i == 4 }*****" }
  end
  def search
    @users = User.search(params[:groups][:name])
  end

end
