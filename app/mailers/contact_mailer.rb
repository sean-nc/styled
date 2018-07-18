class ContactMailer < ApplicationMailer
  def contact_email(message)
    @email = message.email
    @body = message.body
    mail(to: 'rubyemailsender123@gmail.com', subject: 'Contact Form - On Trend')
  end
end
