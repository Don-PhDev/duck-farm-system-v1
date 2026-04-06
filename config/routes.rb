Rails.application.routes.draw do
  get "mortality_logs/index"
  get "mortality_logs/new"
  get "mortality_logs/create"
  get "expenses/index"
  get "expenses/new"
  get "expenses/create"
  get "feed_consumptions/index"
  get "feed_consumptions/new"
  get "feed_consumptions/create"
  get "feed_purchases/index"
  get "feed_purchases/new"
  get "feed_purchases/create"
  get "sales/index"
  get "sales/show"
  get "sales/new"
  get "sales/create"
  get "batches/index"
  get "batches/show"
  get "batches/new"
  get "batches/create"
  get "batches/edit"
  get "batches/update"
  get "dashboard/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
