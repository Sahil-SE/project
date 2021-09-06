require "rails_helper"

Rspec.describe User, type: :model do
    
    describe 'associations' do
        it { should have_many(:user_responses) }
        it { should have_many(:assessors) }
        it { should have_many(:casestudy_users) }
        it { should have_many(:casestudies).through(:casestudy_users) }
        it { should have_many(:role_users) }
        it { should have_many(:roles).through(:role_users) }
        it { should have_many(:casestudies).class_name("Casestudy").with_foreign_key("contentcreator_id") }
    end
    
    describe 'validations' do
        it { should validate_presence_of(:name) }
        it { should validate_uniqueness_of(:email) }
        it " asda" do
            @user=create(:student)
            puts @user
        end
    end
end