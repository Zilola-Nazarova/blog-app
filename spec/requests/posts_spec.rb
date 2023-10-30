require 'rails_helper'

RSpec.describe "Posts", type: :request do
  context "GET /index" do
    it "returns successful response" do
      get '/users/:user_id/posts'
      expect(response).to be_successful
    end

    it "returns http status 200" do
      get '/users/:user_id/posts'
      expect(response.status).to eq(200)
    end
    
    it "renders the right view file" do
      get '/users/:user_id/posts'
      expect(response).to render_template(:index)
    end

    it "renders the right placeholder" do
      get '/users/:user_id/posts'
      expect(response.body).to include('<h1>Here is a list of posts for a given user</h1>')
    end
  end
end
