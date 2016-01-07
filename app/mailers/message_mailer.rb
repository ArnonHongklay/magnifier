class MessageMailer < ActionMailer::Base
  default from: "runnable@example.com"

  def send_mail account, new_mail
     @message = new_mail
    mail(to: account.email, :subject => @message.subject, :body => @message.body)
  end

  def auto_mail account, newmail
    @automail = newmail
    mail(to: account.email, :subject => "Information From Server Monitor", :body => "Disk ของคุณใกล้จะเต็มแล้ว")
  end
end
