Rails.application.routes.draw do
  root to: 'url_shorter#index'
  get '/:url', to: 'url_shorter#index'
  get '/url_detail/:url', to: 'url_shorter#url_detail'
  post '/url', to: "url_shorter#url"
  jsonapi_resources :url_shorter, only: [:create]
end
