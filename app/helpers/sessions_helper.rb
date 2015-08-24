module SessionsHelper

  def signed?
    @user_status == 'signed_in'
  end
  
end
