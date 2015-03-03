class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception| redirect_to root_path, alert: "You can't access this page" end

  def after_sign_in_path_for(user)
    if user.email.empty?
      new_user_user_path(id: user.id)
    else
      list_path
    end

  end


end
