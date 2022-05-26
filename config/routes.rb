Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # deeds routes
  get "/deed" => "deeds#index"
  get "/deed/:id" => "deeds#show"
  post "/deed" => "deeds#create"
  patch "/deed/:id" => "deeds#update"
  delete "/deed/:id" => "deeds#destroy"


  # Friends routes
  get "/friend" => "friends#index"
  get "/friend/:id" => "friends#show"
  post "/friend" => "friends#create"
  patch "/friend/:id" => "friends#update"
  delete "/friend/:id" => "friends#destroy"
  get "friend/:id/deeds" => "friends#show_deeds"
end
