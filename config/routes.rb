Rails.application.routes.draw do

  root to: "home#index"

  get 'dashboard_creatordash', to: 'dashboard#creatordash', as: 'creator_dasboard'
  get 'dashboard_assessordash', to: 'dashboard#assessordash', as: 'assessor_dashboard'
 
  get 'dashboard_testdash', to: 'dashboard#testdash', as: 'test_dashboard'

  get 'dashboard_userdash', to: 'dashboard#userdash', as: 'user_dashboard'
  
  get 'casestudy_users', to: 'user_responses#index', as: 'instructions'
  get 'casestudy_users/:casestudy_user_id/exam', to: 'user_responses#exam', as: 'start_exam'
  patch 'casestudy_users/:casestudy_user_id/user_response/:id', to: 'user_responses#update', as: 'save_response'
  post '/casestudy_users/:casestudy_user_id/update_time', to: 'user_responses#update_time', as: 'update_time'
  get 'casestudy_users/:casestudy_user_id/submit', to: 'user_responses#submit', as: 'final_submit'

  get 'casestudy_users/assessor/evaluations', to: 'assessor_responses#index', as: 'evaluations'
  get 'casestudy_users/eval/:casestudy_user_id', to: 'assessor_responses#eval', as: 'start_evaluation'
  patch 'casestudy_users/eval/:casestudy_user_id/assessor_response/:id', to: 'assessor_responses#update', as: 'save_assessor_response'
  get 'casestudy_users/eval/:casestudy_user_id/submit', to: 'assessor_responses#submit', as: 'assessor_final_submit'

  devise_for :users

  
  get 'dashboard_creatordash/manage_casestudy_users', to: 'casestudy_users#index', as: 'list_of_casestudies_for_assigning'
  get 'dashboard_creatordash/assign_casestudy_users/:casestudy_id', to: 'casestudy_users#new', as: 'assign_casestudies_to_users'
  post 'dashboard_creatorordash/assign_casestudy_users/:casestudy_id', to: 'casestudy_users#create', as: 'create_casestudies_to_users'



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
  delete 'casestudies/:casestudy_id/questions/delete/:id', to: 'questions#destroy', as: 'delete_question'

  get 'casestudies/:casestudy_id/questions/:question_id/add_traits', to: 'question_traits#new', as: 'add_traits'
  post 'casestudies/:casestudy_id/questions/:question_id/', to: 'question_traits#create', as: 'assign_traits'
  delete 'casestudies/:casestudy_id/questions/:question_id/:id', to: 'question_traits#destroy', as: 'delete_question_traits'


  get 'casestudies/:casestudy_id/pages', to: 'pages#index', as: 'casestudy_pages'
  get 'casestudies/:casestudy_id/pages/new', to: 'pages#new', as: 'new_page'
  post 'casestudies/:casestudy_id/pages', to: 'pages#create'
  get 'casestudies/:casestudy_id/pages/:id', to: 'pages#show', as: 'page'
  get 'casestudies/:casestudy_id/pages/:id/edit', to: 'pages#edit', as: 'edit_page'
  patch 'casestudies/:casestudy_id/pages/:id', to: 'pages#update'
  delete 'casestudies/:casestudy_id/pages/delete/:id', to:'pages#destroy', as: 'delete_page'

  get 'traits', to: 'traits#index', as: 'traits'
  get 'traits/new', to: 'traits#new', as: 'new_traits'
  post 'traits', to: 'traits#create'
  get 'traits/:id', to: 'traits#show', as: 'trait'
  get 'traits/:id/edit', to: 'traits#edit', as: 'edit_trait'
  patch 'traits/:id', to: 'traits#update'

  # get 'questions/:id/new', to: 'questions#new', as: 'new_question'

  get 'home/index'
  get 'home/index/walkin/:casestudy_id/:assessor_id', to: 'walkin_registration#new', as: 'walkin_registration'
  post 'home/index/walkin/:casestudy_id/:assessor_id', to: 'walkin_registration#create', as: 'create_walkin_registration'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end