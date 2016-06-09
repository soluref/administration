class User < ActiveRecord::Base

	has_secure_password

	def admin?
	self.role == 'admin'
	end

	def editor?
	['editor', 'admin'].include? self.role
	end

	validates :nom, presence: true,
                    length: { minimum: 5 }
					

end
