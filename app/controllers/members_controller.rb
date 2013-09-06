class MembersController < ApplicationController

  def index
  end
  def new
     #redirect_to root_path, :notice=> "You already been member of this group" if(  Membership.includes(params[:groups][:user_id]))
     @members=Membership.new
  end
  def create
    @members=Membership.new(params[:membership])
    if @members.save
      #logger.debug "**********\n\n\n\n\n\n #{@members.error.full_messages}"
      #redirect_to @members
      render "members/index"
    else
      #logger.debug "**********\n\n\n\n\n\n #{@members.error.full_messages}"
      render 'new'
    end
  end
  def member
    @members=Membership.find_all_by_group_name(params[:members][:group_name])
  end
  def show
    @members=Membership.find(params[:id])
  end

end



