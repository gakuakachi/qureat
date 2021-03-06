Rails.application.routes.draw do
  devise_for :users

  resources :restaurants do
    resources :reviews, except: [:index, :show]
    collection do
      get 'search'
      get 'continue'
    end
  end
  root 'restaurants#index'

  match '/about_us', to: 'pages#about_us', via: :get
  match '/contact_us', to: 'pages#contact_us', via: :get
end
