class ApplyMailer < ActionMailer::Base
  default :from => "noreply@deroseforleaders.org"
  default :to => "afalkear@gmail.com"

  def new_apply_form(message)
    @message = message
    mail(:subject => "[DeRose Method For Leaders] New Apply Message from company #{@message.company}")
  end
end
