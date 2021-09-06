require '/home/jombay-admin/projects/simulation_6/spec/rails_helper.rb'
Rspec.describe Casestudy, type: :model do
    describe 'associations' do
        it { should belong_to(:contentcreator) }
        it { should have_many(:pages) }
        it { should have_many(:casestudy_users) }
        it { should have_many(:users) }
        it { should have_many(:questions) }
    end

    descirbe 'validations' do
        it { should validate_presence_of(:duration) }
        it { should validate_presence_of(:scale) }
    end
end