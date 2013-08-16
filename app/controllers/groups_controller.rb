class GroupsController < ApplicationController

  def new
    @group=Group.new
  end

  def create
    @group=Group.new(params[:group])
    #@user = User.create( params[:user] )
    if @group.save
      redirect_to @group
    else
      render 'users/show'
    end
  end

  def show
    @group=Group.find(params[:id])
  end
  def list
    @users=User.all
    render  'list'
  end
  def user_groups
    #@groups=current_user.owned_groups
    @groups=current_user.owned_groups
    render 'user_groups'
  end
  def add_user
    @add_user = User.find(params[:id])
  end
end
