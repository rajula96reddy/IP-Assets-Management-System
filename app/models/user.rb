class User < ApplicationRecord
  enum role: [:user, :ip_committee, :admin]
  after_initialize :set_default_role, :if => :new_record?
  # has_many: Research_Groups
  has_many:ownerships
  has_many:posts
  has_many:ip_assets,:through=>:ownerships
  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  scope :role, -> (role) { where role: 2 }
end
