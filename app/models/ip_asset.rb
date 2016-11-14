class IpAsset < ApplicationRecord
  has_and_belongs_to_many:owner
  # after_create :create_user
  # def self.create_user(a)
  # 	Owner.create(:royalty=> '0', :Is_stateholder=>'0',:ip_assets_id=>a.id)
  # end
  def self.copy(a,b)
  	@owner=Owner.create(:royalty=> '0', :Is_stateholder=>'0',:user_id=>a.owner_id)
    
    self.create(:Research_group_ID => a.Research_group_ID,:Type=>a.Type,
     :Labs_Associated=>a.Labs_Associated,:owner_id=>'1')
    a.delete
  	# @owner=Owner.update(:ip_assets_id=>)
    end
  end
