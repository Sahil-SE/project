class CasestudyUser < ApplicationRecord
    belongs_to :casestudy
    belongs_to :user
    belongs_to :assessor, class_name: "User", foreign_key: "user_id"
    has_many :user_responses, dependent: :destroy
    has_many :assessor_responses, dependent: :destroy
    
    enum status: [:Not_started, :in_progress, :submitted_but_not_assessed, :submitted_and_assessed]
    validate :check_user_and_assessor

    after_initialize :init

  def init
    #self.status = :Not_started
    #self.time_elapsed = 0
   # self.started_time = 
   # self.completed_time = 
  end

  def check_user_and_assessor
    errors.add(:assessor_id, "can't be the same as user_id") if user_id == assessor_id
  end
end
