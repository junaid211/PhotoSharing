class SessionsController < ApplicationController
before_filter :check_user_login,:only=>[:show, :new, :login_attempt]
before_filter :authenticate_user, :except => [:index, :new,:login_attempt, :logout]
  def new
  end
  def show
  end

  def login_attempt
    authorized_user = User.authenticate(params[:users][:email],params[:users][:password])
    #7.times { |i| logger.debug "*****#{ authorized_user.inspect if i == 4 }*****" }
    if authorized_user
      session[:user_id] = authorized_user.id
      redirect_to current_user, :notice => "Wow Welcome again, you logged in as #{authorized_user.name}"
      #7.times { |i| logger.debug "*****#{ session.inspect if i == 4 }*****" }
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "new"
    end
  end

  def logout
    #session[:user_id]=nil
    session[:user_id]=nil
    #7.times { |i| logger.debug "*****#{ session.inspect if i == 4 }****" }
    redirect_to :action => 'new'
  end
  def destroy
    redirect_to :action => 'logout'
  end
  def create
    @session=User.find(params[:id])
  end
end
