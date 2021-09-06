require "rails_helper"

Rspec.describe CasestudyUser, type: :model do
    
    describe 'associations' do
        it { should belong_to(:casestudy) }
        it { should belong_to(:user) }
        it { should belong_to(:assessor).class_name("Casestudy").with_foreign_key("contentcreator_id") }
        it { should have_many(:user_responses) }
        it { should have_many(:assessor_responses) }
    end
end