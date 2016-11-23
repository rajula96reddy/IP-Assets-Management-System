class Ownership < ApplicationRecord
belongs_to:ip_asset,optional: true
belongs_to:user,optional: true
# accepts_nested_attributes_for :user, :reject_if => :all_blank
# validates_uniqueness_of  [:user_id, :ip_asset] 
# => {:scope => [:user_id, :ip_asset_id], :message => "already exists"}
end
