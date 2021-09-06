FactoryBot.define do
    factory :trait do
       sequence(:trait) { |n| "Trait_#{n}"}
    end
end