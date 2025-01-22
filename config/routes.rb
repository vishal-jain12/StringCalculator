Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'string_addition#index'
  post 'calculate', to: 'string_addition#calculate_addition'
end
