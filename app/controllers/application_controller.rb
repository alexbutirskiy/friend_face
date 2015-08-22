class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def index
    @user_status = cookies[:user_status]
    @user = User.find(cookies[:user_id])
    byebug
    puts
  end

  def signed?
    @user_status == 'signed_in'
  end

end
