require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  include ActionController::RespondWith
  let(:profile) { create(:profile) }
  let(:user) { profile.user }

  describe "PUT /show" do
    let(:auth_params) do
      login
      auth_params = get_auth_params_from_login_response_headers(response)
      auth_params
    end

    it "returns http success" do
      put user_profile_path, headers: auth_params
      expect(response).to have_http_status(:success)
    end

    it "returns http error" do
      put user_profile_path
      expect(response).to have_http_status(:unauthorized)
    end

    it "is valid updated introduction" do
      introduction = "a" * 10
      put user_profile_path, params: { introduction: introduction }, headers: auth_params
      expect(JSON.parse(response.body)['introduction']).to eq introduction
    end

    it "is valid updated gender" do
      gender = 2
      put user_profile_path, params: { gender: gender }, headers: auth_params
      expect(JSON.parse(response.body)['gender']).to eq gender
    end

    it "is valid updated birthday" do
      birthday = Date.new(2000, 5, 30).to_s
      put user_profile_path, params: { birthday: birthday }, headers: auth_params
      expect(JSON.parse(response.body)['birthday']).to eq birthday
    end
  end

  def login
    post user_session_path, params: { email: user.email, password: 'password' }.to_json,
                            headers: {
                              'CONTENT_TYPE' => 'application/json',
                              'ACCEPT' => 'application/json',
                            }
  end

  def get_auth_params_from_login_response_headers(response)
    client = response.headers['client']
    token = response.headers['access-token']
    expiry = response.headers['expiry']
    token_type = response.headers['token-type']
    uid = response.headers['uid']

    auth_params = {
      'access-token' => token,
      'client' => client,
      'uid' => uid,
      'expiry' => expiry,
      'token-type' => token_type,
    }
    auth_params
  end
end
