require "rails_helper"

Rspec.describe Page, type: :model do
    describe 'associations' do
        it { should belong_to(:casestudy) }
    end
end