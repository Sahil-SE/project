class Question < ApplicationRecord
	belongs_to :casestudy
	has_many :question_traits 
	has_many :traits, through: :question_traits, dependent: :destroy
	has_many :user_responses, dependent: :destroy

	validates :body, presence: true
end
