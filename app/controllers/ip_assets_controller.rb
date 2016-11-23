class IpAssetsController < ApplicationController
  before_action :set_ip_asset, only: [:show, :edit, :update, :destroy,:copy]

  # GET /ip_assets
  # GET /ip_assets.json
  def index

    @ip_assets = IpAsset.where("status ='Not_approved'").all
  end
   def my_index
    # a=current_user.id
    @ip_assets = IpAsset.includes(:ownerships).where("user_id"=>current_user.id,"status" => "Approved").all
    # @ip_assets = Ownership.find_by_id(id: IpAsset.where(id:current_user.id)).all
      # (:ip_asset).where(user_id: current_user.id,status: "Approved").all
  end
  def new_index
    @ip_assets = IpAsset.where("status ='Approved'").all
    
   
    if params[:search]
      value=
      @ip_assets = IpAsset.search(params[:search], params[:search_column],params[:search_column4]).where("status ='Approved'")
    else
      @ip_assets = IpAsset.all.order('created_at ASC').where("status ='Approved'")
    end
     if params[:search_column3]
      @ip_assets=IpAsset.search1(params[:search_column3], params[:search_column2],params[:search_column4]).where("status ='Approved'")
    end
    if params[:search_column5]
      if(params[:search_column5]!='Display all IP-assets' && params[:search_column5]!='SELECT NUMBER OF IP ASSETS TO BE DISPLAYED')
      @ip_assets=IpAsset.all.first(params[:search_column5].to_i).where("status ='Approved'")
    else
      
      @ip_assets = IpAsset.all.where("status ='Approved'")
    end
    end
    
  end
  def edit_request
    @ip_assets = IpAsset.all
  end

  def delete_request
      @ip_assets = IpAsset.all
  end
  def public_index
    # @ip_assets = IpAsset.where("user_id")
  end
  def share_royalty
    # @ip_assets = IpAsset.includes(:ownerships).where("user_id"=>current_user.id,"status" => "Approved").all
    # @owners=Ownership.includes(:ip_assets).where("ip_asset_id"=>params[:ip_asset]).all
    # p @owners.first
    # params[:id]
    @owners=Ownership.where(:ip_asset_id=>params[:ip_asset])
    # @owner=@owners.first
    @owners.each do |owner|
      owner.individual_royalty=owner.stakeholding_percentage*2
      # (params[:Total_royalty])
      owner.save
    end
    redirect_to share_royalty_ip_assets_path(@owners)
    # redirect_to @
  end
  def own 

  end
  # GET /ip_assets/1
  # GET /ip_assets/1.json
  def show
  end
    # GET /ip_assets/new
  def new
    @ip_asset = IpAsset.new
    # @ownerships=
    @ip_asset.ownerships.build
    # 3.times{ @ip_asset.ownerships.build }
    # @ownership=Ownership.create(:ip_asset_id=> @ip_asset.id,:user_id=>@ip_asset.user_id)
    # @ownership.save
  end

  # GET /ip_assets/1/edit
  def edit

  end
  def edit_asset
    @ip_asset = IpAsset.find(params[:ip_asset])
    # @ip_asset1=IpAsset.new
    # @ip_asset.dup
   @ip_asset1=IpAsset.new(@ip_asset_params)
   @ip_asset1.Title = @ip_asset.Title
   @ip_asset1.Description = @ip_asset.Description
   @ip_asset1.Is_patented = @ip_asset.Is_patented
   @ip_asset1.user_id = @ip_asset.user_id
   @ip_asset1.Is_licensed = @ip_asset.Is_licensed
   @ip_asset1.accessibility = @ip_asset.accessibility 
    @ip_asset1.status="Edit_request"
    @ip_asset1.Original_id=@ip_asset.id
    @ip_asset.Original_id=-1
    @ip_asset.save
    @ip_asset1.save
    redirect_to edit_ip_asset_path(@ip_asset)
  end
  def set_approved
    @ip_asset = IpAsset.find(params[:ip_asset])
    @ip_asset.status='Approved'
    @ip_asset.save
    @ownership=Ownership.create(:ip_asset_id=> @ip_asset.id,:user_id=>@ip_asset.user_id)
    
    redirect_to @ip_asset
    
  end
  def set_edit
   @ip_asset = IpAsset.find(params[:ip_asset])
   @ip_asset1 = IpAsset.new
   @ip_asset1 = IpAsset.find_by Original_id: @ip_asset.id
   @ip_asset1.destroy
   # @ip_asset.status
   @ip_asset.Original_id='0'
   @ip_asset.save

   # @ownership=Ownership.create(:ip_asset_id=> @ip_asset.id,:user_id=>@ip_asset.user_id)
   
    redirect_to @ip_asset
    
  end
   def set_not_edit
   @ip_asset = IpAsset.find(params[:ip_asset])
   @ip_asset1 = IpAsset.find_by Original_id: @ip_asset.id
   @ip_asset2=IpAsset.new
   @ip_asset2.Title = @ip_asset1.Title
   @ip_asset2.Description = @ip_asset1.Description
   @ip_asset2.Is_patented = @ip_asset1.Is_patented
   @ip_asset2.user_id = @ip_asset1.user_id
   @ip_asset2.Is_licensed = @ip_asset1.Is_licensed
   @ip_asset2.accessibility = @ip_asset1.accessibility 
   @ip_asset2.id=@ip_asset.id
   @ip_asset.destroy
   @ip_asset2.status=@ip_asset1.status
   # @ip_asset.update(@ip_asset1.attributes)
   # @ip_asset1.destroy
   @ip_asset2.save

   # @ownership=Ownership.create(:ip_asset_id=> @ip_asset.id,:user_id=>@ip_asset.user_id)
   
    redirect_to @ip_asset
    
  end 
  # POST /ip_assets
  # POST /ip_assets.json
  def create
    @ip_asset = IpAsset.new(ip_asset_params)
    @ip_asset.status='Not_approved'
    @ip_asset.user_id=current_user.id
    respond_to do |format|
      if @ip_asset.save
        format.html { redirect_to @ip_asset, notice: 'Ip asset was successfully created.' }
        format.json { render :show, status: :created, location: @ip_asset }
      else
        format.html { render :new }
        format.json { render json: @ip_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ip_assets/1
  # PATCH/PUT /ip_assets/1.json
  def update
    respond_to do |format|
      if @ip_asset.update(ip_asset_params)
        format.html { redirect_to @ip_asset, notice: 'Ip asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @ip_asset }
      else
        format.html { render :edit }
        format.json { render json: @ip_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ip_assets/1
  # DELETE /ip_assets/1.json
  def destroy
    @ip_asset.destroy
    respond_to do |format|
      format.html { redirect_to ip_assets_url, notice: 'Ip asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def delete_asset
    @ip_asset = IpAsset.find(params[:ip_asset])
    @ip_asset1=@ip_asset.dup
    @ip_asset1.status="Delete_request"
    @ip_asset1.Original_id=@ip_asset.id
    @ip_asset.Original_id=-2
    @ip_asset.save
    @ip_asset1.save
    redirect_to @ip_asset
  end
  def set_delete
    @ip_asset = IpAsset.find(params[:ip_asset])
    @ip_asset1 = IpAsset.find_by Original_id: @ip_asset.id
    # @ip_asset = IpAsset.find(params[:ip_asset])
    @ip_asset1.destroy
    @ip_asset.status='Deleted'
    @ip_asset.Original_id='0'
    @ip_asset.save
    # @ownership=Ownership.create(:ip_asset_id=> @ip_asset.id,:user_id=>@ip_asset.user_id)
    
    redirect_to @ip_asset
    
  end
    def set_not_delete
    @ip_asset = IpAsset.find(params[:ip_asset])
    @ip_asset1 = IpAsset.find_by Original_id: @ip_asset.id
    # @ip_asset = IpAsset.find(params[:ip_asset])
    # @ip_asset.status=@ip_asset1.status
    @ip_asset1.destroy
    @ip_asset.Original_id="NULL"
    @ip_asset.save
    # @ownership=Ownership.create(:ip_asset_id=> @ip_asset.id,:user_id=>@ip_asset.user_id)
    
    redirect_to @ip_asset
    
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ip_asset
      @ip_asset = IpAsset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ip_asset_params
      params.require(:ip_asset).permit(:Research_group_ID, :Type, :Labs_Associated,:Title,:user_id,
        :attachment,:Is_patented,:Is_licensed,:Original_id,:Description,:Total_royalty,
        :accessibility,ownerships_attributes: [:id,:content, :user_id, :ip_asset_id,:stakeholding_percentage,:_destroy] ,
        users_attributes: [:id,:user_id,:_destroy])
    end
end
