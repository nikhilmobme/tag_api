Rails.application.routes.draw do
  resources :entities
  get 'specific_status', to:'entities#specific_status'
  get 'status_all', to:'entities#status_all'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
