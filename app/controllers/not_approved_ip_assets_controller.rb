class NotApprovedIpAssetsController < ApplicationController
  before_action :set_not_approved_ip_asset, only: [:show, :edit, :update, :destroy]

  # GET /not_approved_ip_assets
  # GET /not_approved_ip_assets.json
  def index
    @not_approved_ip_assets = NotApprovedIpAsset.all
  end

  # GET /not_approved_ip_assets/1
  # GET /not_approved_ip_assets/1.json
  def show
  end

  # GET /not_approved_ip_assets/new
  def new
    @not_approved_ip_asset = NotApprovedIpAsset.new
  end

  # GET /not_approved_ip_assets/1/edit
  def edit
  end

  # POST /not_approved_ip_assets
  # POST /not_approved_ip_assets.json
  def create
    @not_approved_ip_asset = NotApprovedIpAsset.new(not_approved_ip_asset_params)

    respond_to do |format|
      if @not_approved_ip_asset.save
        format.html { redirect_to @not_approved_ip_asset, notice: 'Not approved ip asset was successfully created.' }
        format.json { render :show, status: :created, location: @not_approved_ip_asset }
      else
        format.html { render :new }
        format.json { render json: @not_approved_ip_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /not_approved_ip_assets/1
  # PATCH/PUT /not_approved_ip_assets/1.json
  def update
    respond_to do |format|
      if @not_approved_ip_asset.update(not_approved_ip_asset_params)
        format.html { redirect_to @not_approved_ip_asset, notice: 'Not approved ip asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @not_approved_ip_asset }
      else
        format.html { render :edit }
        format.json { render json: @not_approved_ip_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /not_approved_ip_assets/1
  # DELETE /not_approved_ip_assets/1.json
  def destroy
    @not_approved_ip_asset.destroy
    respond_to do |format|
      format.html { redirect_to not_approved_ip_assets_url, notice: 'Not approved ip asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_not_approved_ip_asset
      @not_approved_ip_asset = NotApprovedIpAsset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def not_approved_ip_asset_params
      params.require(:not_approved_ip_asset).permit(:Research_group_ID, :Type, :Labs_Associated)
    end
end
