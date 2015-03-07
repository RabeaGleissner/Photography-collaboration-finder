class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:new_user, :show]
  load_and_authorize_resource

  def index
    @users = User.all
    @films = Film.all
  end

  def list
    @users = User.where.not(id: current_user.id)
    
    @collaborations = Collaboration.where("collaborator1_id = ? or collaborator2_id = ?", current_user.id, current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @films = @user.films
    @current_user_initiated_collaboration = Collaboration.where(collaborator1_id: current_user.id, collaborator2_id: @user.id)
    @user_initiated_collaboration = Collaboration.where(collaborator1_id: @user.id, collaborator2_id: current_user.id)

    if @user.uid
      @photosets = flickr.photosets.getList(user_id: @user.uid)
      @selected_set = flickr.photosets.getList(user_id: @user.uid, id: @user.album.flickr_id)

      unless @user.album.flickr_id.blank?
        @first_10_selected_set_photos = flickr.photosets.getPhotos(photoset_id: @user.album.flickr_id, privacy_filter: '1').photo.first(10)

        @users_selected_photos = @user.album.photos

        @selected_set_photos = flickr.photosets.getPhotos(photoset_id: @user.album.flickr_id, privacy_filter: '1').photo

      end
    end
  end

def edit
    @films = Film.all
    @user = User.find(params[:id])
    per_page = 15

  unless @user.album.flickr_id.blank?
      @album_photos = flickr.photosets.getPhotos(photoset_id: @user.album.flickr_id, privacy_filter: '1', per_page: per_page).photo
    end

    if @user.uid
      @photosets = flickr.photosets.getList(user_id: @user.uid)
    end

 if request.xhr?

   @album_id = params[:selected_album_id]

    @album_photos = flickr.photosets.getPhotos(photoset_id: @album_id, privacy_filter: '1', per_page: per_page).photo

   render partial: "album_photo",  layout: false
 end
end

  def update
    @user.album.photos.destroy_all
    params[:user][:album_attributes][:photos_attributes].delete_if { |_id, photo_attribute| photo_attribute[:flickr_id] == '0' } rescue nil
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  def update_new_user
    @user.update(user_params)
    redirect_to @user
  end

  def new_user
    @films = Film.all
  end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :flickr_name, :location, :uid, :provider, :availability, :receive_email, :image, {film_ids: [] },
      {album_attributes: [:id, :flickr_id, :selected_album_id, { photos_attributes: [:id, :flickr_id] } ]
    }
    )
  end

end
