class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def flickr
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Signed in through Flickr"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      flash.notice = "There was a problem creating an account"
      redirect_to new_user_registration_url
    end
  end
end