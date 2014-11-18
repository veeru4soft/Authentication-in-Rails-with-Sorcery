class SessionsController < ApplicationController
  def new
  end
  
  def create
   
    user = login(params[:sessions][:email],params[:sessions][:password], params[:sessions][:remember_me_token])
    if user
      redirect_to index_path, :notice => "Logged in!"
    else
      flash.now.alert = "Email or password was invalid"
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end
end
