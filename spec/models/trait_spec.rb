require "rails_helper"

Rspec.describe Trait, type: :model do

    describe 'associations' do
        it { should have_many(:question_traits) }
    end
    describe 'validations' do
        it { should validate_presence_of(:name) }
    end
end