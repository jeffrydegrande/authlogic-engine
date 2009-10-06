class User < ActiveRecord::Base
  has_permalink :username

  acts_as_authentic
  
  validates_presence_of :email
  
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    UserNotifier.deliver_password_reset_instructions(self)  
  end
end
