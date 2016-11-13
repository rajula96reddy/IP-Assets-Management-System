class IpAsset < ApplicationRecord
  def self.copy(a)
    self.create(:Research_group_ID => a.Research_group_ID,:Type=>a.Type,
     :Labs_Associated=>a.Labs_Associated)
    a.delete
    end
  end
