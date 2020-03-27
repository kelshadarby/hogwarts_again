Rails.application.routes.draw do
  get '/professors', to: 'professors#index'
end
