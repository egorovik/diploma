class UserMailer < ActionMailer::Base

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
    @url  = "#{root_url}users/#{user.activation_token}/activate"
    mail(:to => user.email,
         :subject => "Регистрация в приложении") do |format|
      format.html 
      format.text
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
  def activation_success_email(user)
    @user = user
    @url  = "#{root_url}login"
    mail(:to => user.email,
         :subject => "Регистрация подтверждена!") do |format|
      format.html 
      format.text 
    end
  end
  
  def reset_password_email(user)
    @user = user
    @url  = edit_password_reset_url(user.reset_password_token)
    mail(:to => user.email,
         :subject => "Изменение пароля") do |format|
      format.html 
      format.text 
    end
  end
end
