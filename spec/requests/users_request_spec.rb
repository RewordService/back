require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:users) { create_list(:user, 5) }
  let!(:user) { create(:user) }

  describe "GET /index" do
    it "returns http success" do
      get users_path q: { nameCont: "" }, page: 1
      expect(response).to have_http_status(:success)
    end

    it "return users" do
      get users_path q: { nameCont: "" }, page: 1
      expect(response.body).to eq User.all.to_json
    end

    it "return search result users" do
      search,page = "a",1
      get users_path q: { nameCont: search }, page: page
      expect(response.body).to eq User.ransack({ nameCont: search }).result.page(page).to_json
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get user_path user
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /auth/sign_up" do
    it "returns http success" do
      post user_registration_path, params: {
        name: Faker::Name.name, email: Faker::Internet.email,
        password: 'password', password_confirmation: 'password',
      }
      expect(response).to have_http_status(:success)
    end

    it "is exist reword record" do
      expect(user.reword).to be_present
    end

    it "is exist profile record" do
      expect(user.profile).to be_present
    end
  end

  describe "GET /latest" do
    it "returns http success" do
      get latest_users_path
      expect(response).to have_http_status(:success)
    end

    it "return latest users" do
      get latest_users_path
      expect(response.body).to eq User.all.order(:id).to_json
    end
  end

  describe "GET /ranked" do
    it "returns http success" do
      get ranked_users_path
      expect(response).to have_http_status(:success)
    end
  end
end
