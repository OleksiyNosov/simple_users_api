Rails.application.routes.draw do
  resources :users, except: [:create, :edit] do
    resources :books, except: [:create, :edit] 
  end
end
