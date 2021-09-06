FactoryBot.define do
    factory :page do
        casestudy
        sequence(:body) { |n| "Casestudy No. #{casestudy.id} Page No. #{n}"}
    end
end