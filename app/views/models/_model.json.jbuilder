json.extract! model, :id, :brand_id, :name, :fuel_type, :engine_size, :power, :power_unit, :torque, :transmission, :acceleration, :urban_consumption, :extra_urban_consumption, :combined_consumption, :top_speed, :created_at, :updated_at
json.url model_url(model, format: :json)
