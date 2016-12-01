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
validate :IIITB_stake


def Is_IIITB
  if self.ownerships.present?
  @o=self.ownerships
  # .find_by user_id: '6'
# p "FUCk"
# p @o
  if @o.present?
    # @a=@o.select{|o| o.user_id =='6'}
    # p @a.any?
    if !(@o.select{|o| o.user_id ==5}).any?
        errors.add(:ip_asset, "IIITB must be one of the owners")
    end
   end
  end
end
def IIITB_stake
  if self.ownerships.present?
  @o=self.ownerships
  if @o.present?
    if (@o.select{|o| o.user_id ==5}).any?
        @a=(@o.select{|o| o.user_id ==5}) 
        p @o
        p 'AA'
        # p @a.select{}
        # p @a[0].stakeholding_percentage
        # [:stakeholding_percentage]
        # p @o.select{|o| o.user_id ==6}.stakeholding_percentage
        p self.Is_funded_by_colege
        # errors.add(:ip_asset, "IIITB must be one of the owner")
        if(self.Is_funded_by_colege == true)
          p "in if condition 1"
          if(@a[0].stakeholding_percentage<50)
            errors.add(:ip_asset, "IIITB stakeholding percentage must be greater than equal to 50")
            # exit
          end
        end
        if(self.Is_funded_by_colege == false)
          if(@a[0].stakeholding_percentage<20)
            errors.add(:ip_asset, "IIITB stakeholding percentage must be greater than equal to 20")
          end
        end

        # errors.add(:ip_asset, "IIITB must be one of the owners")
    end
   end
  end
end
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
  def self.search(keyword, num)
       if(num=='Display all results' || num=='SELECT NUMBER OF RESULTS TO BE DISPLAYED')
        key = "%#{keyword}%"
columns = %w{Approver_name Approval_id Title Description user_id Type}
where(
  columns
    .map {|c| "#{c} like :search" }
    .join(' OR '),
  search: key
)
      # where("LIKE ?", "%#{keyword}%")
    else
      key = "%#{keyword}%"
columns = %w{Approver_name Approval_id Title Description user_id Type}
where(
  columns
    .map {|c| "#{c} like :search" }
    .join(' OR '),
  search: key
).first(num.to_i)
      # where("LIKE ?", "%#{keyword}%").first(num.to_i)
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
