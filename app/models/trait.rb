class Trait < ApplicationRecord
	has_many :question_traits

	validates :name,  uniqueness: true, presence: true
end
