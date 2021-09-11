Rails.application.routes.draw do
    root to: 'main#index'
    
    get 'about', to: 'about#index' 
    get 'sign_up', to: 'registrations#new'
    post 'sign_up', to: 'registrations#create'

    
    get 'sign_in', to: 'sessions#new'
    post 'sign_in', to: 'sessions#create'

    get 'sessions', to: 'session#new'

    delete 'logout', to: 'sessions#destroy'
   
    get 'borrow/:id', to: 'books#borrow', as: 'borrow_path'
    get 'return/:id', to: 'books#return', as: 'return_path'
  

    resources :books 
    resources :issued_books
      
    resources :users

   
   
end
