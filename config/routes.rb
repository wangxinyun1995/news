Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/home_resource', to: 'static_pages#home_resource'
  get  '/search', to: 'static_pages#search'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  get  '/log',  to: 'static_pages#log'

  mount Api::Test => '/api'
  if Setting.use_swagger_doc
    mount GrapeSwaggerRails::Engine => '/apidoc'
  end

end
