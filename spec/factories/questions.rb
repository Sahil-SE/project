FactoryBot.define do
    factory :questions do
        casestudy
        sequence(:tile) { |n| "Title #{n}" }
        sequence(:body) { |n| "Body of #{n}" }
    end
end