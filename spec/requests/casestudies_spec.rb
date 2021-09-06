require "rails_helper"

RSpec.describe " Casestudies Req", type: :request do
    before do
        @user = create(:creator)
        sign_in @user
        # puts Role.all.inspect
        # puts RoleUser.all.inspect
        # puts User.all.inspect
        # puts current_user.inspect
    end

    it "List of casestudies" do
        get '/casestudies'
        #puts response.body
       # puts @user.inspect
        expect(response).to render_template(:index)
    end

    describe "POST casestudies#create" do
        it 'create casestudy with valid attributes' do
          casestudy_params = { #casestudy: {
            tile: "CS 1",
            duration: 60,
            scale: 10,
            passkey: "123abc"
          }#}
          post '/casestudies', :params => casestudy_params.to_json, :headers => { "Content-Type": "application/json" }
          json = JSON.parse(response.body)
          expect(response).to have_http_status(201)
        end
    end

        describe 'PATCH casestudies#update' do
            it 'should update the scale' do
              casestudy_params = { casestudy: {
                tile: 'CS 1',
                duration: 60,
                scale: 10,
                passkey: '123abc'
              }}
        
              new_casestudy_params = { casestudy: {
                tile: 'CS 1',
                duration: 60,
                scale: 7,
                passkey: '123abc'
              }}
              casestudy = Casestudy.create(casestudy_params[:casestudy])
              patch 'casestudies/#{casestudy.id}', :params => new_casestudy_params.to_json, :headers => headers
              json = JSON.parse(response.body)
              expect(json["casestudy"]).to include("scale" => 7)
            end
        end
    end

