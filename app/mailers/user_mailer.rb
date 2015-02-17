class UserMailer < ActionMailer::Base
 default from: "film-swapsters@film-swap.herokuapp.com"

     def partner_alert(user, current_user)
      @user = user
      @current_user = current_user
       mail(to: user.email, subject: "Film Swapsters: You have a new film partner")
     end
end
