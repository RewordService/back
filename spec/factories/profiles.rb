FactoryBot.define do
  factory :profile do
    gender { 1 }
    introduction { "MyString" }
    birthday { "2021-01-30" }
    user { create(:user) }
  end
end
