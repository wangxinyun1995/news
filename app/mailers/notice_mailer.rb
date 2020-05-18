class NoticeMailer < ApplicationMailer
  def notice_email(addrr, email)
    @notice = email
    mail(to: addrr, subject: email.subject)
  end
end
