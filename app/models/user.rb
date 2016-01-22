class User < ActiveRecord::Base
  rolify
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates_integrity_of  :avatar
  validates_processing_of :avatar
end
