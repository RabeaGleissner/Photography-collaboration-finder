class UserMailer < ActionMailer::Base
 default from: "from@example.com"

     def partner_alert(user)
       mail(to: user.email, subject: "Film Swapsters: You have a new film partner")
     end
end
