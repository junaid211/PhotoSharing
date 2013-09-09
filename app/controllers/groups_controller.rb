class GroupsController < ApplicationController

  def new
    @group=Group.new
  end
  def create
    @group=Group.new(params[:group])
    if @group.save
      redirect_to @group
    else
      render "groups/new"
    end
  end

  def show
    @group=Group.find(params[:id])
  end
  def list
    @users = User.search(params[:search])
    render  'list'
  end
  def user_groups
    @groups=current_user.owned_groups
    render 'user_groups'
  end
  def add_user
    @add_user = User.find(params[:id])
  end
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to user_groups_groups_path
  end

end
