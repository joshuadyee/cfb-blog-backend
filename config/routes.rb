Rails.application.routes.draw do
  get "/posts" => "posts#index"
  get "/posts/:id" => "posts#show"
  post "/posts" => "posts#create"
  patch "/posts/:id" => "posts#update"
  delete "/posts/:id" => "posts#destroy"
end
