Rails.application.routes.draw do
  root 'calculator#index'
  post 'calculate', to: 'calculator#calculate', as: 'calculate_calories'

  get 'bmi', to: 'bmi#index'
  post 'calculate_bmi', to: 'bmi#calculate', as: 'calculate_bmi'

  get 'ideal_weight', to: 'ideal_weight#index'
  post 'calculate_ideal_weight', to: 'ideal_weight#calculate', as: 'calculate_ideal_weight'
end
