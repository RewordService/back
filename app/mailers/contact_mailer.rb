class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: 'izszzz@yahoo.co.jp', subject: " Reword お問い合わせ" 
  end
end
