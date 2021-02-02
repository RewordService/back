require 'rails_helper'

RSpec.describe "Rewords", type: :request do
  let!(:user) { create(:user) }
  let!(:reword) { user.create_reword }
  let!(:auth_params) do
    login(user)
    auth_params = get_auth_params_from_login_response_headers(response)
    auth_params
  end

  describe "GET /info" do
    it "returns http success" do
      get reword_info_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT /user/reword" do
    it "returns http success" do
      put user_reword_path, params: { "count": 2, "result": "success" }, headers: auth_params
      expect(response).to have_http_status(:success)
    end

    it "returns http error without headers" do
      put user_reword_path, params: { "count": 2, "result": "fail" }
      expect(response).to have_http_status(:unauthorized)
    end

    it "is valid increment total" do
      put user_reword_path, params: { "count": 2, "result": "fail" }, headers: auth_params
      expect(Reword.find(reword.id).total).to eq 1
    end

    it "is valid increment 1 column success" do
      put user_reword_path, params: { "count": 2, "result": "success" }, headers: auth_params
      expect(reword.reload["2"]["total"]).to eq 1
      expect(reword.reload["2"]["success"]).to eq 1
      expect(reword.reload["score"]).to eq 3
    end
  end
end
