class IpAsset < ApplicationRecord
  has_and_belongs_to_many:user
  def self.copy(a,b)
    self.create(:Research_group_ID => a.Research_group_ID,:Type=>a.Type,
     :Labs_Associated=>a.Labs_Associated,:user_id=>a.user_id)
    a.delete
    end
  end
