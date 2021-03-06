class User < ActiveRecord::Base
  has_secure_password
  has_many :tools
  enum role: [:default, :admin]
end
