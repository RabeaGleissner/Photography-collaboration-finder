class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:new_user, :show]
  load_and_authorize_resource

  def index
    @user = current_user
    @users = User.all
    @films = Film.all
  end

  def show
    @user = User.find(params[:id])
    @films = @user.films
    @current_user_initiated_collaboration = Collaboration.where(collaborator1_id: current_user.id, collaborator2_id: @user.id)
    @user_initiated_collaboration = Collaboration.where(collaborator1_id: @user.id, collaborator2_id: current_user.id)

    if @user.uid
    @photosets = flickr.photosets.getList(user_id: @user.uid)
    @selected_set = flickr.photosets.getList(user_id: @user.uid, id: @user.album.flickr_id)
  
    if @user.album.flickr_id != ""
    @first_10_selected_set_photos = flickr.photosets.getPhotos(photoset_id: @user.album.flickr_id, privacy_filter: '1').photo.first(10)

    @selected_set_photos = flickr.photosets.getPhotos(photoset_id: @user.album.flickr_id, privacy_filter: '1').photo
    end
    end
  end

  def edit

    @films = Film.all
    @user = User.find(params[:id])

  if @user.album.flickr_id != ""
    @all_selected_set_photos = flickr.photosets.getPhotos(photoset_id: @user.album.flickr_id, privacy_filter: '1').photo
end
    if @user.uid
    @photosets = flickr.photosets.getList(user_id: @user.uid)
    end
  end

  def update
    album = Album.new
    album.update(flickr_id: params[:albums])
    album.save

    current_user.update(user_params)
    redirect_to user_path(current_user.id)
  end


  def new_user
    @films = Film.all
    @user = User.find(params[:id])
  end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :flickr_name, :location, :uid, :provider, :availability, :image, {film_ids: []},
      {album_attributes: [:id, :flickr_id]},
      {photo_attributes: [:id, :flickr_id]}
      )
  end

end
