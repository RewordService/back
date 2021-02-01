# frozen_string_literal: true

class User < ActiveRecord::Base
  after_create :create_reword, :create_profile
  has_one :profile
  has_one :reword
  mount_uploader :image, AvatarUploader
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  def create_reword
    build_reword
  end

  def create_profile
    build_profile
  end
end
