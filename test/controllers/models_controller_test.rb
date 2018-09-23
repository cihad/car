require 'test_helper'

class ModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @model = models(:one)
  end

  test "should get index" do
    get models_url
    assert_response :success
  end

  test "should get new" do
    get new_model_url
    assert_response :success
  end

  test "should create model" do
    assert_difference('Model.count') do
      post models_url, params: { model: { acceleration: @model.acceleration, brand_id: @model.brand_id, combined_consumption: @model.combined_consumption, engine_size: @model.engine_size, extra_urban_consumption: @model.extra_urban_consumption, fuel_type: @model.fuel_type, name: @model.name, power: @model.power, power_unit: @model.power_unit, top_speed: @model.top_speed, torque: @model.torque, transmission: @model.transmission, urban_consumption: @model.urban_consumption } }
    end

    assert_redirected_to model_url(Model.last)
  end

  test "should show model" do
    get model_url(@model)
    assert_response :success
  end

  test "should get edit" do
    get edit_model_url(@model)
    assert_response :success
  end

  test "should update model" do
    patch model_url(@model), params: { model: { acceleration: @model.acceleration, brand_id: @model.brand_id, combined_consumption: @model.combined_consumption, engine_size: @model.engine_size, extra_urban_consumption: @model.extra_urban_consumption, fuel_type: @model.fuel_type, name: @model.name, power: @model.power, power_unit: @model.power_unit, top_speed: @model.top_speed, torque: @model.torque, transmission: @model.transmission, urban_consumption: @model.urban_consumption } }
    assert_redirected_to model_url(@model)
  end

  test "should destroy model" do
    assert_difference('Model.count', -1) do
      delete model_url(@model)
    end

    assert_redirected_to models_url
  end
end
