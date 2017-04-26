class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  # Finds a user by user ID.
  def get_user
    @user = User.find_by(id: :user_id)
  end
  
  private
  
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        redirect_to login_url
      end
    end
  
end
