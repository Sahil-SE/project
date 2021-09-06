require "rails_helper"

Rspec.describe Question, type: :model do
    describe 'associations' do
        it { should belong_to(:casestudy) }
        it { should have_many(:question_traits) }
        it { should have_many(:traits).through(:question_traits) }
        it { should have_many(:user_responses) }
    end

    describe 'validations' do
        it { should validate_presence_of(:body) }

    end
end