class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:new_user, :show]

  def index
    @users = User.all

  end

  def show
    @photos = current_user.flickr.photosets.getPhotos(photoset_id: '72157626714345858').photo
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to users_path
  end

  def new_user
    # current_user.update(user_params)
  end

  def gallery
    
  end

  def tips
    
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :flickr_name, :location, :uid, :provider, :availability, :image)
  end

end
