Rails.application.routes.draw do
  root "articles#index"

  #! route method, 'route', to: 'controller#method'
  resources :articles

end
