class ApplicationMailer < ActionMailer::Base
  before_action :set_mail_header

  def set_mail_header
    headers['X-SYSTEM-PROCESS-ID'] = Process.pid
  end

  default from: 'from@example.com'
  layout 'mailer'
end
