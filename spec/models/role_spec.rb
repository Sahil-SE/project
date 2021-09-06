require "rails_helper"

Rspec.describe Role, type: :model do
        
        describe 'associations' do
             it { should have_many(:role_users) }
             it { should have_many(:users).through(:role_users) }
        end

        describe 'validations' do
                it { should validate_presence_of(:name) }
        end
end