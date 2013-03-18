class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url  = "http://www.chrisbeard-photography.co.uk/"
    
    mail(:to => user.email, 
         :from => "chris@chrisbeard-images.com",
         :subject => "Welcome to My Awesome Site")
  end

  def activation_instructions(user)
    @user = user
    @url  = "http://www.chrisbeard-photography.co.uk/"
    @activation_url = "abc"
    mail(:to => user.email,
         :from => "chris@chrisbeard-images.com",
         :subject => "Activation Instructions")
  end
end
