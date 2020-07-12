Rails.application.routes.draw do
  namespace :application, path: '/' do
    root to: "home#index"
  end

  namespace :admin, path: 'admin' do
    get '/', to: 'home#index'

    resources :offers
    put 'offers/:id/toggle_status', to: 'offers#toggle_status', as: :offer_toggle_status
  end
end
