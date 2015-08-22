class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.create(name: params[:user][:name], password: params[:user][:password])
    if @user.errors.empty?
      redirect_to root_path
    else
      render plain: @user.errors.messages[:name].to_s + @user.errors.messages[:password].to_s
    end
  end
end
