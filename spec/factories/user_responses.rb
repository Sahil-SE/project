FactoryBot.define do
    factory :user_response do
        question
        casestudy_user
        user { create(:student) }
        sequence(:response) { |n| "Response of #{user.name}" }
    end
end