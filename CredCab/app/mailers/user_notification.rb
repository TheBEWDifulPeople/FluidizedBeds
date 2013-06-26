class UserNotification < ActionMailer::Base
  default from: "notification@credcabinet.com"

  def notification_email(user)
  	@user = user
    mail(to: @user.email, subject: 'Your Semi-Annual Credential Update')
  end

end
