require "rails_helper"

Rspec.describe QuestionTrait, type: :model do
    describe 'associations' do
        it { should belong_to(:question) }
        it { should belong_to(:trait) }
        it { should have_many(:assessor_responses) }
    end
end