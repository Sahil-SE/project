FactoryBot.define do
    factory :casestudy do
        sequence(:tile) { |n| "Casestudy #{n}"}
        duration { 60 }
        scale { 5 }
        passkey { '123abc' }
        creator { create(:cc) }
    end
end