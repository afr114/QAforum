class UserMailer < ApplicationMailer
  default from: "admin@stack-clone.com"
  # default to: user.email


  def signup_confirmation(user)
    @user = user
    
    mail to: user.email, subject: "Sign up confirmation"
  end



end
