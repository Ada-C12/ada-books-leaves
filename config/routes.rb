Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    # Routes that operate on the book collection

    # Set the homepage route
    root 'books#index'

    resources :books #, except: [:index]

    resources :authors, only: [:index, :show, :new, :create] do
      resources :books, only: [:index, :new]
    end

    # get 'authors/:author_id/books', to: 'books#index', as: 'author_books'

    # get 'authors/', to: 'authors#index', as: 'authors'
    # get 'authors/:id', to: 'authors#show', as: 'author'

    # get '/books', to: 'books#index', as: 'books'
    # get '/books/new', to: 'books#new', as: 'new_book'
    # post '/books', to: 'books#create'
  
    # # Routes that operate on individual books
    # get '/books/:id', to: 'books#show', as: 'book'
    # get '/books/:id/edit', to: 'books#edit', as: 'edit_book'
    # patch '/books/:id', to: 'books#update'
    # delete '/books/:id', to: 'books#destroy'
  
end
