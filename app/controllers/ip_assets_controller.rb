class IpAssetsController < ApplicationController
  before_action :set_ip_asset, only: [:show, :edit, :update, :destroy]

  # GET /ip_assets
  # GET /ip_assets.json
  def index
    @ip_assets = IpAsset.all
  end

  # GET /ip_assets/1
  # GET /ip_assets/1.json
  def show
  end

  # GET /ip_assets/new
  def new
    @ip_asset = IpAsset.new
  end

  # GET /ip_assets/1/edit
  def edit
  end

  # POST /ip_assets
  # POST /ip_assets.json
  def create
    @ip_asset = IpAsset.new(ip_asset_params)

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ip_asset
      @ip_asset = IpAsset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ip_asset_params
      params.require(:ip_asset).permit(:Research_group_ID, :Type, :Labs_Associated)
    end
end
