class MachineAssetsController < ApplicationController
  before_action :set_machine_asset, only: [:show, :edit, :update, :destroy]

  # GET /machine_assets
  # GET /machine_assets.json
  def index
    @machine_assets = MachineAsset.all
  end

  # GET /machine_assets/1
  # GET /machine_assets/1.json
  def show
  end

  # GET /machine_assets/new
  def new
    @machine_asset = MachineAsset.new
  end

  # GET /machine_assets/1/edit
  def edit
  end

  # POST /machine_assets
  # POST /machine_assets.json
  def create
    @machine_asset = MachineAsset.new(machine_asset_params)

    respond_to do |format|
      if @machine_asset.save
        format.html { redirect_to @machine_asset, notice: 'Machine asset was successfully created.' }
        format.json { render :show, status: :created, location: @machine_asset }
      else
        format.html { render :new }
        format.json { render json: @machine_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /machine_assets/1
  # PATCH/PUT /machine_assets/1.json
  def update
    respond_to do |format|
      if @machine_asset.update(machine_asset_params)
        format.html { redirect_to @machine_asset, notice: 'Machine asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @machine_asset }
      else
        format.html { render :edit }
        format.json { render json: @machine_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machine_assets/1
  # DELETE /machine_assets/1.json
  def destroy
    @machine_asset.destroy
    respond_to do |format|
      format.html { redirect_to machine_assets_url, notice: 'Machine asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_machine_asset
      @machine_asset = MachineAsset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def machine_asset_params
      params.require(:machine_asset).permit(:asset_number, :asset_name, :asset_description, :asset_location, :asset_owner, :asset_technician, :asset_serial_number, :asset_fluid_type, :asset_criticality, :asset_status)
    end
end
