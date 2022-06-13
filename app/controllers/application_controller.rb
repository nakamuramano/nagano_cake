class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_genres_path
    #when User
      #users_home_path
    end
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

end
