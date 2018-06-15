require 'test_helper'

class AssetSensorDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asset_sensor_datum = asset_sensor_data(:one)
  end

  test "should get index" do
    get asset_sensor_data_url
    assert_response :success
  end

  test "should get new" do
    get new_asset_sensor_datum_url
    assert_response :success
  end

  test "should create asset_sensor_datum" do
    assert_difference('AssetSensorDatum.count') do
      post asset_sensor_data_url, params: { asset_sensor_datum: { asset_quality_score_lf: @asset_sensor_datum.asset_quality_score_lf, asset_quality_score_tdn: @asset_sensor_datum.asset_quality_score_tdn, asset_tempeture: @asset_sensor_datum.asset_tempeture, input_date: @asset_sensor_datum.input_date, machine_asset_id: @asset_sensor_datum.machine_asset_id } }
    end

    assert_redirected_to asset_sensor_datum_url(AssetSensorDatum.last)
  end

  test "should show asset_sensor_datum" do
    get asset_sensor_datum_url(@asset_sensor_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_asset_sensor_datum_url(@asset_sensor_datum)
    assert_response :success
  end

  test "should update asset_sensor_datum" do
    patch asset_sensor_datum_url(@asset_sensor_datum), params: { asset_sensor_datum: { asset_quality_score_lf: @asset_sensor_datum.asset_quality_score_lf, asset_quality_score_tdn: @asset_sensor_datum.asset_quality_score_tdn, asset_tempeture: @asset_sensor_datum.asset_tempeture, input_date: @asset_sensor_datum.input_date, machine_asset_id: @asset_sensor_datum.machine_asset_id } }
    assert_redirected_to asset_sensor_datum_url(@asset_sensor_datum)
  end

  test "should destroy asset_sensor_datum" do
    assert_difference('AssetSensorDatum.count', -1) do
      delete asset_sensor_datum_url(@asset_sensor_datum)
    end

    assert_redirected_to asset_sensor_data_url
  end
end
