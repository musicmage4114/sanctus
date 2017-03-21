Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'general_pages#home'

  get '/help', to: 'general_pages#help'
  get '/about', to: 'general_pages#about'
  get '/contact', to: 'general_pages#contact'
end
