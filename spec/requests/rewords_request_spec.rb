require 'rails_helper'

RSpec.describe "Rewords", type: :request do
  describe "GET /info" do
    it "returns http success" do
      get reword_info_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /info" do
    it "returns http success" do
      put user_reword_path
      expect(response).to have_http_status(:success)
    end
  end
end
