class NoticeMailer < ApplicationMailer
  def notice_email(addrr, email)
    @notice = email
    @logs = XiGua.where("created_at > ?", Time.now.at_beginning_of_day)
    mail(to: addrr, subject: email.subject)
  end

  def error_email(addrr, msg, error)
    @error = error
    mail(to: addrr, subject: msg)
  end
end
