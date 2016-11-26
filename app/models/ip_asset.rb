class IpAsset < ApplicationRecord
  # after_create :create_user
  # def self.create_user(a)
  # 	Owner.create(:royalty=> '0', :Is_stateholder=>'0',:ip_assets_id=>a.id)
  # end
# attr_accessible :Title,
#                   :Description,
#                   :ownerships_attributes
                  # :instructions,

  # validate :validating_sum
  # validates_with Validater
  mount_uploader :attachment, AttachmentUploader
  has_many :users,:through=>:ownerships
  has_many :ownerships,:dependent=>:destroy 
  accepts_nested_attributes_for :ownerships,allow_destroy: true,update_only: true,:reject_if => lambda { |c| c[:user_id].blank? }
  accepts_nested_attributes_for :users
  validates_presence_of :Title,:Description,:attachment
validate :sum_100
validate :Is_IIITB
def Is_IIITB
  if self.ownerships.present?
  @o=self.ownerships
  # .find_by user_id: '6'
# p "FUCk"
# p @o
  if @o.present?
    # @a=@o.select{|o| o.user_id =='6'}
    # p @a.any?
    if !(@o.select{|o| o.user_id ==6}).any?
    # @o.each do |o|
      # @a=o.where(:user_id=>6)
      # p o.user_id
      # @a=o
      # if o.user_id == 6
        errors.add(:ip_asset, "IIITB must be one of the owners")
        # p "fuck"
      # end
      # p @a
      # p @a.present?
    end
      # if (@a.present?)
     # end 
  # if @o.where(:user_id=>'6').all?
    # end
  end
  # , :reject_if => lambda { |a| a[:content].blank?}
  end
  end
  # accepts_nested_attributes_for :users, :reject_if => lambda { |a| a[:content].blank?}
  # scope :not_approved, :conditions => {:status => 0}
# scope :not_approved, ->  { where (status: 0) } 
 
 # def validating_sum

 #    if(IpAsset.first.ownerships.all?)
 #        @owner=IpAsset.ownerships
 #        sum =0
 #        a = @owner.sum(:stakeholding_percentage)
 #        errors.add(:ip_asset, "some error")
 #        # @owner.each do |owne|
 #        #   sum = sum +
 #      end
 #    end
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

  def sum_100
    if self.ownerships.present?
     # p self.ownerships.sum(:stakeholding_percentage)
     sum =0
     self.ownerships.each do |owner|
     if(owner.stakeholding_percentage!=nil)
       sum = sum + owner.stakeholding_percentage
     end
    end
     # p sum
     if sum != 100
       errors.add(:ip_asset, "Sum of stakeholding percentages should be 100")
    end
  end
end
end
