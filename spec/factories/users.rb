FactoryBot.define do
    factory :user do
        
        trait :user_student do
            sequence(:name, '1') { |n| "student #{n}"}
            sequence(:email, '1') { |n| "student#{n}@mail.com"}
            password { "123abc" }
        end

        trait :user_assessor do
            sequence(:name, '1') { |n| "assessor #{n}"}
            sequence(:email, '1') { |n| "assessor#{n}@mail.com"}
            password { "123abc" }
        end

        trait :user_creator do
            sequence(:name, '1') { |n| "assessor #{n}"}
            sequence(:email, '1') { |n| "assessor#{n}@mail.com"}
            password { "123abc" }
        end

        before(:create) do
            create(:student_role) if !Role.exists?(name: "student")
        end

        trait :assign_assesor_role do
            after(:create) do |user|
                user.roles << create(:assessor_role) unless Role.exists?(name: "assesor")      
            end
        end

        trait :assign_creator_role do
            after(:create) do |user|
                user.roles << create(:creator_role) unless Role.exists?(name: "creator")      
            end
        end

        factory :student, traits: [:user_student]
        factory :assessor, aliases: [:creator], traits: [:user_assessor, :assign_assesor_role]
        factory :cc, traits: [:user_creator, :assign_creator_role]
        
    end
end