class Profile < ApplicationRecord
  belongs_to :user
  validates_length_of :introduction, maximum: 160, allow_blank: true
end
