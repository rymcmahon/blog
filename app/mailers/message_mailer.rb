class MessageMailer < ApplicationMailer
  default from: 'ryan@rymcmahon.com'

  def message_notification(message)
    @message = message
    mail(to: 'rymcmahon716@gmail.com', subject: 'New Message', reply_to: @message.email)
  end
end
