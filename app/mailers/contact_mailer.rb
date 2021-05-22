class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: 'yuya19920721@outlook.jp', subject: "投稿完了"
  end
end
