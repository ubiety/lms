# User mailer class
class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_mail.subject
  #
  def reset_password_email(user)
    @user = User.find user.id
    @url = edit_password_reset_url(@user.reset_password_token, host: 'http://localtest.me:5000')
    mail(to: @user.email, subject: 'LMS Password Reset')
  end

  def new_account_email(user)
    @user = user
    @url = activate_user_url(@user.activation_token, host: 'http://localtest.me:5000')
    mail(to: @user.email, subject: 'Welcome to LMS')
  end

  def activation_success_email(user)
    @user = user
    mail(to: @user.email, subject: 'Account activated')
  end
end
