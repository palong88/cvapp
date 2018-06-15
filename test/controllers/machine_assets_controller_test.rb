require 'test_helper'

class MachineAssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @machine_asset = machine_assets(:one)
  end

  test "should get index" do
    get machine_assets_url
    assert_response :success
  end

  test "should get new" do
    get new_machine_asset_url
    assert_response :success
  end

  test "should create machine_asset" do
    assert_difference('MachineAsset.count') do
      post machine_assets_url, params: { machine_asset: { asset_criticality: @machine_asset.asset_criticality, asset_description: @machine_asset.asset_description, asset_fluid_type: @machine_asset.asset_fluid_type, asset_location: @machine_asset.asset_location, asset_name: @machine_asset.asset_name, asset_number: @machine_asset.asset_number, asset_owner: @machine_asset.asset_owner, asset_serial_number: @machine_asset.asset_serial_number, asset_status: @machine_asset.asset_status, asset_technician: @machine_asset.asset_technician } }
    end

    assert_redirected_to machine_asset_url(MachineAsset.last)
  end

  test "should show machine_asset" do
    get machine_asset_url(@machine_asset)
    assert_response :success
  end

  test "should get edit" do
    get edit_machine_asset_url(@machine_asset)
    assert_response :success
  end

  test "should update machine_asset" do
    patch machine_asset_url(@machine_asset), params: { machine_asset: { asset_criticality: @machine_asset.asset_criticality, asset_description: @machine_asset.asset_description, asset_fluid_type: @machine_asset.asset_fluid_type, asset_location: @machine_asset.asset_location, asset_name: @machine_asset.asset_name, asset_number: @machine_asset.asset_number, asset_owner: @machine_asset.asset_owner, asset_serial_number: @machine_asset.asset_serial_number, asset_status: @machine_asset.asset_status, asset_technician: @machine_asset.asset_technician } }
    assert_redirected_to machine_asset_url(@machine_asset)
  end

  test "should destroy machine_asset" do
    assert_difference('MachineAsset.count', -1) do
      delete machine_asset_url(@machine_asset)
    end

    assert_redirected_to machine_assets_url
  end
end
