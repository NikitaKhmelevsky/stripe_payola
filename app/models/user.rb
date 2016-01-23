class User < ActiveRecord::Base
  rolify

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_default_role

  has_one :subscription, class_name: 'Payola::Subscription', foreign_key: 'owner_id'

  validates_integrity_of  :avatar
  validates_processing_of :avatar

  def assign_default_role
    add_role(:user)
  end
end
