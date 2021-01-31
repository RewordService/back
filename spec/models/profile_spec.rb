require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:profile) { build(:profile) }

  describe "introduction" do
    it "is valid" do
      expect(profile).to be_valid
    end

    context "should be invalid" do
      it "over max length" do
        profile.introduction = "a" * 161
        expect(profile).to be_invalid
      end
    end
  end
end
