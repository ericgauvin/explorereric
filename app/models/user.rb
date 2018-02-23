class User < ApplicationRecord
	before_save { self.email = email.downcase }
	after_initialize :init
	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

	def User.digest(string)
	 cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
																								 BCrypt::Engine.cost
	 BCrypt::Password.create(string, cost: cost)
 end

 	def init
 		self.role ||= "standard"
 	end

end
