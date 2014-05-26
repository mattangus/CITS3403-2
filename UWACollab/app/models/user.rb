class User < ActiveRecord::Base
  has_secure_password

  has_many :files

  validates :first, :presence => true, :length => { :maximum => 50 }
  validates :last, :presence => true, :length => { :maximum => 50 }
  validates :email, :presence => true, :uniqueness => true,
            :format => { :with => /\w+@\w+\.\w+/,
                         :message =>"abc@examples.com" }
  validates :password, :length => { :within => 6..40 }
end
