class FeedbackMailer < ActionMailer::Base
  default from: "feedback@utahsmedia.com"

  def send_feedback(email, name, content)
    @email = email
    @name = name
    @content = content
    mail(to: ENV['SEND_TO'], subject: "#{name} has a message for UtahLED.")
  end
end
