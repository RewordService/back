require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:users) { create_list(:user, 10) }
  let!(:user) { create(:user) }

  page = 1
  describe "GET /index" do
    it "returns http success" do
      get users_path q: { nameCont: "" }, page: page
      expect(response).to have_http_status(:success)
    end

    it "return users" do
      get users_path q: { nameCont: "" }, page: page
      expect(response.body).to eq User.all.page(1).to_json
    end

    it "return search result users" do
      search = "a"
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
  end

  describe "GET /latest" do
    it "returns http success" do
      get latest_users_path
      expect(response).to have_http_status(:success)
    end

    it "return latest users" do
      get latest_users_path page: page
      expect(response.body).to eq User.all.order(created_at: :desc).page(page).to_json
    end
  end

  describe "GET /ranked" do
    it "returns http success" do
      get ranked_users_path
      expect(response).to have_http_status(:success)
    end

    it "return ranked users" do
      get ranked_users_path page: page
      expect(response.body).to eq Kaminari.paginate_array(
        User.find(Reword.group(:id).order(score: :desc).pluck(:user_id))
      ).page(page).to_json
    end
  end
end
