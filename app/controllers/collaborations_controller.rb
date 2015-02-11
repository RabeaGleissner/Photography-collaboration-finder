class CollaborationsController < ApplicationController
  
  def index
    
  end
  
  def new
    users = User.excluding(current_user).joins(:films).where(films: { id: params[:film_ids]})
    user = users.sample

    if user
      redirect_to user
    else
      flash[:notice] = "There were no users that matched your search"
      redirect_to root_url
    end
    
  end

end