# User mailer class
class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_mail.subject
  #
  def reset_password_email(user)
    @user = User.find user.id
    @url = edit_password_resets_url(@user.reset_password_token)
    mail(to: @user.email, subject: 'LMS Password Reset')
  end
end
