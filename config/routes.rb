Rails.application.routes.draw do
  root 'calculator#index'
  post 'calculate', to: 'calculator#calculate', as: 'calculate_calories'
end
