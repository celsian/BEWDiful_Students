ShirtReview::Application.routes.draw do
  root "shirts#index"
  get "/shirts", to: "shirts#index", as: "shirts"
  post "/search", to: "shirts#search", as: "shirt_search"

  resources :shirts
end
