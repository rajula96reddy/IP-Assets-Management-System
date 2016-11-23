class IpAsset < ApplicationRecord
  # after_create :create_user
  # def self.create_user(a)
  # 	Owner.create(:royalty=> '0', :Is_stateholder=>'0',:ip_assets_id=>a.id)
  # end
# attr_accessible :Title,
#                   :Description,
#                   :ownerships_attributes
                  # :instructions,

  mount_uploader :attachment, AttachmentUploader
  has_many :users,:through=>:ownerships
  has_many :ownerships,:dependent=>:destroy 
  accepts_nested_attributes_for :ownerships,allow_destroy: true,update_only: true,:reject_if => lambda { |c| c[:user_id].blank? }
  accepts_nested_attributes_for :users
  # , :reject_if => lambda { |a| a[:content].blank?}
  
  # accepts_nested_attributes_for :users, :reject_if => lambda { |a| a[:content].blank?}
  # scope :not_approved, :conditions => {:status => 0}
# scope :not_approved, ->  { where (status: 0) } 
 
  def self.search(keyword, column_name,num)
    if self.column_names.include?(column_name.to_s)
       if(num=='Display all results' || num=='SELECT NUMBER OF RESULTS TO BE DISPLAYED')
      where("#{column_name} LIKE ?", "%#{keyword}%")
    else
      where("#{column_name} LIKE ?", "%#{keyword}%").first(num.to_i)
    end
      
    
    end
  end
  def self.search1(value1, value,num)
      if IpAsset.column_names.include?(value1)
      if(value=='ASCENDING ORDER')
        if(num=='Display all results' || num=='SELECT NUMBER OF RESULTS TO BE DISPLAYED')
      order("#{value1} ASC")
    else
      order("#{value1} ASC").first(num.to_i)
    end
      elsif(value=='DESCENDING ORDER')
         if(num=='Display all results' || num=='SELECT NUMBER OF RESULTS TO BE DISPLAYED')
      order("#{value1} DESC")
    else
      order("#{value1} DESC").first(num.to_i)
    end
      else
        if(num=='Display all results' || num=='SELECT NUMBER OF RESULTS TO BE DISPLAYED')
      order("#{value1} ASC")
    else
      order("#{value1} ASC").first(num.to_i)
    end
      end
    end
  end
end
