Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'books#top'
  delete 'books' => 'books#destroy', as: 'destroy_book'
  resources :books
end
