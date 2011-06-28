Rails.application.routes.draw do
  namespace :admin do
    resources :products do
      resources :docs
    end
  end
end
