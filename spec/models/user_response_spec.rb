require "rails_helper"

Rspec.describe UserResponse, type: :model do
    describe 'associations' do
        it { should belong_to(:question) }
        it { should belong_to(:casestudy_user) }
        it { should belong_to(:user) }
    end
end