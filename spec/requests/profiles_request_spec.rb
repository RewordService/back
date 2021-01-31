require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  let(:profile) { create(:profile) }
  describe "GET /show" do
    it "returns http success" do
      get user_profile_path profile.user
      expect(response).to have_http_status(:success)
    end

    it "return user" do
      get user_profile_path profile.user
      expect(response.body).to eq profile.user.to_json(include: :profile)
    end
  end
end
