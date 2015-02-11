class CollaborationsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @collaborations = Collaboration.all
    @users = User.all
  end
  
  def new
    users = User.excluding(current_user).where(availability: true).joins(:films).where(films: { id: params[:film_ids]})
    @user = users.sample

    if @user
      @collaboration = Collaboration.new(collaborator1_id: current_user.id, collaborator2_id: @user.id)
      @collaboration.save
      redirect_to user
    else
      flash[:notice] = "There were no users that matched your search"
      redirect_to root_url
    end
    
  end

end