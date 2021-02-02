# frozen_string_literal: true

class User < ActiveRecord::Base
  after_create :after_create_reword
  has_one :reword, dependent: :destroy
  mount_uploader :image, AvatarUploader
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  def after_create_reword
    create_reword
  end

end
