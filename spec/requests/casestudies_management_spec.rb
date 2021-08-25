require 'rails_helper'

RSpec.describe 'Casestudies CRU', type: :request do
  before do
    @user = User.create(name: 'test', email: 'test1@g.c', password: '111111') ## uncomment if not using FactoryBot
    # puts @user.errors.inspect
    @role = Role.create(name: 'contentcreator')
    @user.roles << @role
  end
  after do
    RoleUser.delete_all
    @user.destroy
    @role.destroy
  end

  it 'view all casestudies' do
    # puts @user.roles.inspect
    # puts @user.inspect
    # puts RoleUser.all.inspect
    sign_in @user
    # puts 'sakjfbkjdfhkasdfasd'
    get '/casestudies'
    expect(response).to render_template(:index)
    # expect(response.body).to include('Casestudies#index')
  end
  it 'create a casestudy'
  it 'show a casestudy'
  it 'edit a casestudy'
end
