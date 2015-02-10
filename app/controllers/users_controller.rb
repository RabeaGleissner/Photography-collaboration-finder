class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:new_user, :show]

  def index
    @users = User.all
    @films = Film.all

  end

  def show
    @films = current_user.films
    @photosets = flickr.photosets.getList(user_id: current_user.uid)
    @firstset = flickr.photosets.getList(user_id: current_user.uid).first
    @firstsetphotos = flickr.photosets.getPhotos(photoset_id: @firstset.id, privacy_filter: 1).photo
  end

  def edit
    @films = Film.all
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to user_path(current_user.id)
  end

  def new_user
  
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
    params.require(:user).permit(:email, :flickr_name, :location, :uid, :provider, :availability, :image, {film_ids: []})
  end

end
