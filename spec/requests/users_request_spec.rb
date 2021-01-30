require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:users) { create_list(:user, 5) }
  let(:user) {create(:user)}
  describe "GET /index" do
    it "returns http success" do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it "return users" do
      get users_path
      expect(response.body).to eq User.all.to_json
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get user_path user
      expect(response).to have_http_status(:success)
    end

    it "return user" do
      get user_path user 
      expect(response.body).to eq user.to_json
    end
  end

  describe "GET /latest" do
    it "returns http success" do
      get users_latest_path
      expect(response).to have_http_status(:success)
    end

    it "return latest users" do
      get users_latest_path
      expect(response.body).to eq User.all.order(:id).to_json
    end
  end

  describe "GET /ranked" do
    it "returns http success" do
      get users_ranked_path
      expect(response).to have_http_status(:success)
    end
  end
end
