# == Schema Information 
# Schema version: 20160601094116
#
# Table name: users
#
#  id              :integer         not null, primary key
#  nom             :string
#  email           :string
#  password_digest :string
#  role            :string
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base


	has_secure_password
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	def admin?
	self.role == 'admin'
	end

	def editor?
	['editor', 'admin'].include? self.role
	end

	validates :nom, presence: true,
                    length: { minimum: 5, maximum: 10 }
    
	validates :email, :presence => true,
                    :format   => { :with => email_regex },	
					:uniqueness => { :case_sensitive => false },
					confirmation: true
					
	validates :email_confirmation, presence: true					
					
	validates :password, :presence => true
	
end
