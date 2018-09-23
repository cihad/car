Rails.application.routes.draw do
  root to: "brands#index"

  resources :brands do
    resources :models do
      post :sort, on: :collection
    end

  end
end
