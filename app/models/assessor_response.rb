class AssessorResponse < ApplicationRecord
    belongs_to :question_trait
    belongs_to :casestudy_user
    belongs_to :user
    belongs_to :assessor, class_name: "User"

    validates :assessor_id, numericality: { other_than: :user_id }
end
