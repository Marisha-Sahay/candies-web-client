Rails.application.routes.draw do

  get '/candies', to: 'candies#index'
  get '/candies/new', to: 'candies#new'
  get '/candies/:id', to: 'candies#show'
  post '/candies', to: 'candies#create'
  patch '/candies/:id', to: 'candies#update'
  get '/candies/:id/edit', to: 'candies#edit'
  patch '/candies/:id', to: 'candies#update'
  delete '/candies/:id', to: 'candies#destroy'
end
