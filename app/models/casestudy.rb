class Casestudy < ApplicationRecord
	has_many :pages
	has_many :questions
	has_many :casestudy_users
	has_many :users, through: :casestudy_users

	validates :duration, presence: true
	validates :scale, presence: true	
end
