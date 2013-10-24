WatchIt::Application.routes.draw do
  get "main" => "titles#index", :as => "/titles/index"

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "titles/search" => "titles#search"
  root :to => "titles#index"
  resources :users
  resources :watch_items
  resources :titles do
    resources :reviews, :only => [:create]
  end
  resources :sessions, only: [:new, :create, :destroy]
end
#== Route Map
# Generated on 24 Oct 2013 00:40
#
#         log_out GET    /log_out(.:format)                  sessions#destroy
#          log_in GET    /log_in(.:format)                   sessions#new
#         sign_up GET    /sign_up(.:format)                  users#new
#   titles_search GET    /titles/search(.:format)            titles#search
#            root        /                                   titles#index
#           users GET    /users(.:format)                    users#index
#                 POST   /users(.:format)                    users#create
#        new_user GET    /users/new(.:format)                users#new
#       edit_user GET    /users/:id/edit(.:format)           users#edit
#            user GET    /users/:id(.:format)                users#show
#                 PUT    /users/:id(.:format)                users#update
#                 DELETE /users/:id(.:format)                users#destroy
#     watch_items GET    /watch_items(.:format)              watch_items#index
#                 POST   /watch_items(.:format)              watch_items#create
#  new_watch_item GET    /watch_items/new(.:format)          watch_items#new
# edit_watch_item GET    /watch_items/:id/edit(.:format)     watch_items#edit
#      watch_item GET    /watch_items/:id(.:format)          watch_items#show
#                 PUT    /watch_items/:id(.:format)          watch_items#update
#                 DELETE /watch_items/:id(.:format)          watch_items#destroy
#   title_reviews POST   /titles/:title_id/reviews(.:format) reviews#create
#          titles GET    /titles(.:format)                   titles#index
#                 POST   /titles(.:format)                   titles#create
#       new_title GET    /titles/new(.:format)               titles#new
#      edit_title GET    /titles/:id/edit(.:format)          titles#edit
#           title GET    /titles/:id(.:format)               titles#show
#                 PUT    /titles/:id(.:format)               titles#update
#                 DELETE /titles/:id(.:format)               titles#destroy
#        sessions POST   /sessions(.:format)                 sessions#create
#     new_session GET    /sessions/new(.:format)             sessions#new
#         session DELETE /sessions/:id(.:format)             sessions#destroy
