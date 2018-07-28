Rails.application.routes.draw do
  resources :coordinates
  root 'main#home'
  devise_for :users

  namespace 'api' do
    namespace 'v1' do
      resources :coordinates
      resources :users
    end
  end
end
