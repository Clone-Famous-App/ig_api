require 'rails_helper'

describe 'Posts API', type: :request do
    before do
        user = FactoryBot.create(:user, username:'user testing 1', password:'user password 1', email:'user1@mail.com')
        FactoryBot.create(:post, captions:'Testing' , photo_url:'photo_url_testing', user_id: user.id)
    end

    it 'return all post' do
        get '/posts'

        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(1)
    end
end