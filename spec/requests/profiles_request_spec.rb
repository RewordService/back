require 'rails_helper'
include ActionController::RespondWith

RSpec.describe "Profiles", type: :request do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }

  describe "GET /show" do
    it "returns http success" do
      get user_profile_path user
      expect(response).to have_http_status(:success)
    end

    it "return user" do
      get user_profile_path user
      expect(response.body).to eq user.to_json(include: :profile)
    end
  end

  describe "PUT /show" do
    let(:auth_params) {
      login
      auth_params = get_auth_params_from_login_response_headers(response)
    }
    it "returns http success" do
      put user_profile_path(profile), headers: auth_params
      expect(response).to have_http_status(:success)
    end

    it "should be update introduction" do
      INTRODUCTION= "aaaaaaaaaaaa"
      profile.introduction = INTRODUCTION 
      put user_profile_path(user),params: { introduction: INTRODUCTION}, headers: auth_params
      expect(JSON.parse(response.body)['profile']['introduction']).to eq INTRODUCTION
    end
  end

  def login
    post user_session_path, params:  { email: user.email, password: 'password' }.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
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
      'token-type' => token_type
    }
    auth_params
  end
end
