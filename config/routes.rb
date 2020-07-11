Rails.application.routes.draw do
  namespace :application, path: '/' do
    root to: "home#index"
  end

  namespace :admin, path: 'admin' do
    get '/', to: 'home#index'
  end
end
