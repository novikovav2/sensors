Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #

  root to: 'startic_pages#index'

  constraints format: :json do
    post '/data', to: 'temperature#load'
  end

end
