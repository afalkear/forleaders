class ContactMailer < ActionMailer::Base
  default :from => "noreply@deroseforleaders.org"
  default :to => "afalkear@gmail.com"

  def new_contact_form(message)
    @message = message
    mail(:subject => "[DeRose Method For Leaders] New Contact Message")
  end
end
