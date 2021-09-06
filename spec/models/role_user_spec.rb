require "rails_helper"

Rspec.describe RoleUser, type: :model do
    describe 'associations' do
        it { should belong_to(:role) }
        it { should belong_to(:user) }
    end
end