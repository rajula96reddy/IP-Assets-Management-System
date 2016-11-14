class User < ApplicationRecord
  has_and_belongs_to_many:ip_asset
    has_and_belongs_to_many:not_approved_ip_asset
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  # has_many: Research_Groups
  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
