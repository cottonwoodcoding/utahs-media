class FeedbackMailer < ActionMailer::Base
  include SendGrid

  default from: "feedback@structuredmediasystems.com"

  def send_feedback(email, name, content)
    emails = ['']
    @email = email
    @name = name
    @content = content
    mail(:to => emails, :subject => "#{name} has a message for Structured Media Systems.")
  end
end