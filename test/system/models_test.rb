require "application_system_test_case"

class ModelsTest < ApplicationSystemTestCase
  setup do
    @model = models(:one)
  end

  test "visiting the index" do
    visit models_url
    assert_selector "h1", text: "Models"
  end

  test "creating a Model" do
    visit models_url
    click_on "New Model"

    fill_in "Acceleration", with: @model.acceleration
    fill_in "Brand", with: @model.brand_id
    fill_in "Combined Consumption", with: @model.combined_consumption
    fill_in "Engine Size", with: @model.engine_size
    fill_in "Extra Urban Consumption", with: @model.extra_urban_consumption
    fill_in "Fuel Type", with: @model.fuel_type
    fill_in "Name", with: @model.name
    fill_in "Power", with: @model.power
    fill_in "Power Unit", with: @model.power_unit
    fill_in "Top Speed", with: @model.top_speed
    fill_in "Torque", with: @model.torque
    fill_in "Transmission", with: @model.transmission
    fill_in "Urban Consumption", with: @model.urban_consumption
    click_on "Create Model"

    assert_text "Model was successfully created"
    click_on "Back"
  end

  test "updating a Model" do
    visit models_url
    click_on "Edit", match: :first

    fill_in "Acceleration", with: @model.acceleration
    fill_in "Brand", with: @model.brand_id
    fill_in "Combined Consumption", with: @model.combined_consumption
    fill_in "Engine Size", with: @model.engine_size
    fill_in "Extra Urban Consumption", with: @model.extra_urban_consumption
    fill_in "Fuel Type", with: @model.fuel_type
    fill_in "Name", with: @model.name
    fill_in "Power", with: @model.power
    fill_in "Power Unit", with: @model.power_unit
    fill_in "Top Speed", with: @model.top_speed
    fill_in "Torque", with: @model.torque
    fill_in "Transmission", with: @model.transmission
    fill_in "Urban Consumption", with: @model.urban_consumption
    click_on "Update Model"

    assert_text "Model was successfully updated"
    click_on "Back"
  end

  test "destroying a Model" do
    visit models_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Model was successfully destroyed"
  end
end
