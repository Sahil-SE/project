class Trait < ApplicationRecord
	has_many :question_traits

	validates :name, presence: true
end
