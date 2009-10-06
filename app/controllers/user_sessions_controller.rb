class UserSessionsController < ApplicationController
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:success] = "Successfully logged in"
      redirect_to AuthlogicEngine.login_destination
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find
    unless @user_session.nil?
      @user_session.destroy
      flash[:success] = "Successfully logged out"
    end
    redirect_to AuthlogicEngine.logout_destination
  end

end
