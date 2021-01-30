require 'rails_helper'

RSpec.describe Profile, type: :model do
  let (:profile) {create(:profile)}
  
  describe "introduction" do
    it "should be valid" do
      expect(profile).to be_valid
    end
  end
end
