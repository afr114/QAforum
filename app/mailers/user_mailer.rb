class UserMailer < ApplicationMailer
  default from: "admin@stack-clone.com"
  # default to: user.email

  # Welcome email
  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: "Sign up confirmation"
  end

  # Post email
  def new_question_email(user)
    @user = user

    mail to: user.email, subject: "Thanks for posting!"
  end

  # Answer email

end
