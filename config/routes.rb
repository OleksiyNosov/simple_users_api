Rails.application.routes.draw do
  resources :users, except: [:new, :edit] do
    resources :books, except: [:new, :edit] 
  end
end
