class User < ActiveRecord::Base
  has_secure_password

  validates :first, :presence => true, :uniqueness => true, :length => { :maximum => 50 }
  validates :last, :presence => true, :uniqueness => true, :length => { :maximum => 50 }
  validates :email, :presence => true,
            :format => { :with => /\w+@\w+\.\w+/,
                         :message =>"abc@examples.com" }
  validates :password, :length => { :within => 6..40 }
end
