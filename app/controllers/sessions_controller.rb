class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.password == params[:session][:password]
      cookies[:user_status] = { value: 'signed_in', expires: 1.year.from_now }
      cookies[:user_id] = { value: user.id, expires: 1.year.from_now }
      redirect_to root_path
    else
      render plain: 'No such user'
    end
  end

  def destroy
    cookies.delete :user_status
    redirect_to root_path
  end

end
