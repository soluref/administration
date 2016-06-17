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

  has_many :relationships, :foreign_key => "follower_id",
                           :dependent => :destroy

	has_secure_password
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	def admin?
	self.role == 'admin'
	end

	def editor?
	['editor', 'admin'].include? self.role
	end

	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil  if user.nil?
		return user if user.has_password?(submitted_password)
	end

	def self.authenticate_with_salt(id, cookie_salt)
		user = find_by_id(id)
		(user && user.salt == cookie_salt) ? user : nil
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
