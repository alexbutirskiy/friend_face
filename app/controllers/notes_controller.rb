class NotesController < ApplicationController
  before_action :require_login

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    Note.create(body: params[:note][:body])
    redirect_to notes_path
  end


  def require_login
    @user_status = cookies[:user_status]
    redirect_to root_path if @user_status != 'signed_in'
    @user = User.find(cookies[:user_id])
  end

end
