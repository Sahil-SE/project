FactoryBot.define do
    factory :role do

        trait :student do
            name {'student'}
        end

        trait :assessor do
            name {'assesor'}
        end

        trait :creator do
            name {'creator'}
        end

        factory :student_role, traits: [:student]
        factory :assessor_role, traits: [:assessor]
        factory :creator_role, traits: [:creator]

    end

end



