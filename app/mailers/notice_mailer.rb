class NoticeMailer < ApplicationMailer
  def notice_email(addrr, email)
    @notice = email
    mail(to: addrr, subject: email.subject)
  end

  def error_email(addrr, msg, error)
    @error = error
    mail(to: addrr, subject: msg)
  end
end
