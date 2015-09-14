Rails.application.routes.draw do
  get 'welcome/index'

  #get 'tasks/index'
  resources :tasks do
    collection do
      get :add
    end
  end
  root 'welcome#index'
end
