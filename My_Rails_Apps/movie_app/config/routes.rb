MovieApp::Application.routes.draw do
  root "movies#index"
  get "/movies", to: "movies#index", as: "movies"
  post "/search", to: "movies#search", as: "movies_search"
  get "/all", to: "movies#all", as: "movies_all"

  resources :movies
end
