class UserResponse < ApplicationRecord
    belongs_to :question
    belongs_to :casestudy_user
    belongs_to :user
end
