require 'rails_helper'

RSpec.describe "Users", type: :request do
  context "GET /index" do
    it "returns successful response" do
      get users_path
      expect(response).to be_successful
    end

    it "returns http status 200" do
      get users_url
      expect(response.status).to eq(200)
    end
    
    it "renders the right view file" do
      get users_url
      expect(response).to render_template(:index)
    end

    it "renders the right placeholder" do
      get users_url
      expect(response.body).to include('<h1>Here is a list of users</h1>')
    end
  end

  context "GET /show" do
    let(:valid_attributes) { { "name" => "Tom" } }

    it "returns successful response" do
      user = User.create! valid_attributes
      get user_url(user)
      expect(response).to be_successful
    end

    it "returns http status 200" do
      user = User.create! valid_attributes
      get user_url(user)
      expect(response.status).to eq(200)
    end

    it "renders the right view file" do
      user = User.create! valid_attributes
      get user_url(user)
      expect(response).to render_template(:show)
    end

    it "renders the right placeholder" do
      user = User.create! valid_attributes
      get user_url(user)
      expect(response.body).to include('<h1>Here is a selected user</h1>')
    end
  end
end
