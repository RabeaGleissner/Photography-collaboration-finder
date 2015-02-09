class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all

  end

  def show
    @user = User.find(params[:id])
    @photos = current_user.flickr.photosets.getPhotos(photoset_id: '72157626714345858').photo
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to(user_path(current_user))
  end

  def gallery
    
  end

  def tips
    
  end

  private

  def user_params
    params.require(:user).permit(:email, :flickr_name, :location, :uid, :provider, :availability, :image)
  end

end
