class Casestudy < ApplicationRecord
	

	has_many :pages, dependent: :destroy
	has_many :questions, dependent: :destroy
	has_many :casestudy_users, dependent: :destroy
	has_many :users, through: :casestudy_users
	belongs_to :contentcreator, class_name: "User"

	validates :duration, presence: true
	validates :scale, presence: true	
end
