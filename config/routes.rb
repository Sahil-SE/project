Rails.application.routes.draw do
  get 'dashboard_creatordash', to: 'dashboard#creatordash', as: 'creator_dasboard'
  get 'dashboard_assesordash', to: 'dashboard#assesordash', as: 'assesor_dashboard'
  get 'dashboard_userdash', to: 'dashboard#userdash', as: 'user_dashboard'
  get 'dashboard_testdash', to: 'dashboard#testdash', as: 'test_dashboard'
  devise_for :users
  
  get 'dashboard_assesordash/manage_casestudy_users', to: 'casestudy_users#index', as: 'list_of_casestudies'
  get 'dashboard_assesordash/assign_casestudy_users/:casestudy_id', to: 'casestudy_users#create', as: 'assign_casestudies_to_users'
  post 'dashboard_assesordash/assign_casestudy_users/:casestudy_id', to: 'casestudy_users#list', as: 'list_casestudies_to_users'
  
  get 'casestudies', to: 'casestudies#index', as: 'casestudies'
  get 'casestudies/new', to: 'casestudies#new', as: 'new_casestudy'
  post 'casestudies', to: 'casestudies#create'
  get 'casestudies/:id', to: 'casestudies#show', as: 'casestudy'
  get 'casestudies/:id/edit', to: 'casestudies#edit', as: 'edit_casestudy'
  patch 'casestudies/:id', to: 'casestudies#update'
  
  

  get 'casestudies/:casestudy_id/questions', to: 'questions#index', as: 'casestudy_questions'
  get 'casestudies/:casestudy_id/questions/new', to: 'questions#new', as: 'new_question'
  post 'casestudies/:casestudy_id/questions', to: 'questions#create'
  get 'casestudies/:casestudy_id/questions/:id', to: 'questions#show', as: 'question'
  get 'casestudies/:casestudy_id/questions/:id/edit', to: 'questions#edit', as: 'edit_question'
  patch 'casestudies/:casestudy_id/questions/:id', to: 'questions#update'

  get 'casestudies/:casestudy_id/questions/:question_id/add_traits', to: 'question_traits#new', as: 'add_traits'
  post 'casestudies/:casestudy_id/questions/:question_id/', to: 'question_traits#create', as: 'assign_traits'




  get 'casestudies/:casestudy_id/pages', to: 'pages#index', as: 'casestudy_pages'
  get 'casestudies/:casestudy_id/pages/new', to: 'pages#new', as: 'new_page'
  post 'casestudies/:casestudy_id/pages', to: 'pages#create'
  get 'casestudies/:casestudy_id/pages/:id', to: 'pages#show', as: 'page'
  get 'casestudies/:casestudy_id/pages/:id/edit', to: 'pages#edit', as: 'edit_page'
  patch 'casestudies/:casestudy_id/pages/:id', to: 'pages#update'

  get 'traits', to: 'traits#index', as: 'traits'
  get 'traits/new', to: 'traits#new', as: 'new_traits'
  post 'traits', to: 'traits#create'
  get 'traits/:id', to: 'traits#show', as: 'trait'
  get 'traits/:id/edit', to: 'traits#edit', as: 'edit_trait'
  patch 'traits/:id', to: 'traits#update'

  # get 'questions/:id/new', to: 'questions#new', as: 'new_question'

  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "home#index"

end