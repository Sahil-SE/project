Rails.application.routes.draw do
  get 'dashboard_creatordash', to: 'dashboard#creatordash', as: 'creator_dasboard'
  get 'dashboard_assesordash', to: 'dashboard#assesordash', as: 'assesor_dashboard'
  get 'dashboard_userdash', to: 'dashboard#userdash', as: 'user_dashboard'
  get 'dashboard_testdash', to: 'dashboard#testdash', as: 'test_dashboard'
  devise_for :users
   
  get 'casestudies', to: 'casestudies#index', as: 'casestudies'
  


  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "home#index"

end