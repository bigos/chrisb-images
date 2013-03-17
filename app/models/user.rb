class User < ActiveRecord::Base
  attr_accessible :login, :password, :password_confirmation, :email

  acts_as_authentic
end
