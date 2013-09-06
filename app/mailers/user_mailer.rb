class UserMailer < ActionMailer::Base
  default from: "junaid.ehsan12@gmail.com"

  def welcome_mail(user)
    @user = user
    @url  = 'http://example.com/login_attempt'
    mail(to: @user.email, :subject => 'Welcome to Creative Photo Sharing')
  end
end
