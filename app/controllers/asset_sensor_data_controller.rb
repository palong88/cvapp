class AssetSensorDataController < ApplicationController
  before_action :set_asset_sensor_datum, only: [:show, :edit, :update, :destroy]

  # GET /asset_sensor_data
  # GET /asset_sensor_data.json
  def index
    @asset_sensor_data = AssetSensorDatum.all
  end

  def import
    AssetSensorDatum.import(params[:file])
    redirect_to asset_sensor_data_url, notice: "Sensor Data Imported"
  end
  # GET /asset_sensor_data/1
  # GET /asset_sensor_data/1.json
  def show
  end

  # GET /asset_sensor_data/new
  def new
    @asset_sensor_datum = AssetSensorDatum.new
  end

  # GET /asset_sensor_data/1/edit
  def edit
  end

  # POST /asset_sensor_data
  # POST /asset_sensor_data.json
  def create
    @asset_sensor_datum = AssetSensorDatum.new(asset_sensor_datum_params)

    respond_to do |format|
      if @asset_sensor_datum.save
        format.html { redirect_to @asset_sensor_datum, notice: 'Asset sensor datum was successfully created.' }
        format.json { render :show, status: :created, location: @asset_sensor_datum }
      else
        format.html { render :new }
        format.json { render json: @asset_sensor_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asset_sensor_data/1
  # PATCH/PUT /asset_sensor_data/1.json
  def update
    respond_to do |format|
      if @asset_sensor_datum.update(asset_sensor_datum_params)
        format.html { redirect_to @asset_sensor_datum, notice: 'Asset sensor datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @asset_sensor_datum }
      else
        format.html { render :edit }
        format.json { render json: @asset_sensor_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_sensor_data/1
  # DELETE /asset_sensor_data/1.json
  def destroy
    @asset_sensor_datum.destroy
    respond_to do |format|
      format.html { redirect_to asset_sensor_data_url, notice: 'Asset sensor datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset_sensor_datum
      @asset_sensor_datum = AssetSensorDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_sensor_datum_params
      params.require(:asset_sensor_datum).permit(:machine_asset_id, :input_date, :asset_tempeture, :asset_quality_score_lf, :asset_quality_score_tdn)
    end
end
