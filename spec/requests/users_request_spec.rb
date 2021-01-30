require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/users/index"
      expect(response).to have_http_status(:success)
    end

    it "returns users" do
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/users/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /latest" do
    it "returns http success" do
      get "/users/latest"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /ranked" do
    it "returns http success" do
      get "/users/ranked"
      expect(response).to have_http_status(:success)
    end
  end

end
