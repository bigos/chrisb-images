class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end

  def activation_instructions(user)
    subject       "Activation Instructions"
    from          "noreply@binarylogic.com" # Removed name/brackets around 'from' to resolve "555 5.5.2 Syntax error." as of Rails 2.3.3
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => activate_url(user.perishable_token)
  end

  def welcome(user)
    subject       "Welcome to the site!"
    from          "noreply@binarylogic.com"
    recipients    user.email
    sent_on       Time.now
    body          :root_url => root_url
  end


end
