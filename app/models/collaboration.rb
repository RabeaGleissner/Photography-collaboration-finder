class Collaboration < ActiveRecord::Base

  belongs_to :collaborator1, class_name: "User", foreign_key: 'collaborator1_id'
  belongs_to :collaborator2, class_name: "User", foreign_key: 'collaborator2_id'

  # TODO: make validations work

  # validate :user_available
  # validate :not_collaborated_since_5_times

  # def user_available
  #   if @collaboration.collaborator1.availability == true && @collaboration.collaborator2.availability.availability == true
  #   else
  #     "Error! User is not available"
  #   end
  # end


  def not_collaborated_since_5_times
    
    if current_user.collaborations.count < 5
      number_of_collaborations = current_user.collaborations.count
    else
      number_of_collaborations = 5
    end

    if current_user.collaborations.last(number_of_collaborations).collaborator2_id != @user.id
    else
      "have collaborated before"
    end
  end

end






