class AdminMailer < ActionMailer::Base
  default from: "ohmpiengteam.io@gmain.com"

  def send_diffusion new_mail, account
     @message = new_mail
    mail(to: account.email, :subject => @message.subject)
   end
end
