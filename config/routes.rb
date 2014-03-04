LetolabWebDeveloperTest::Application.routes.draw do

  # Movies index at root
  get "(.:format)", to: "movies#index", as: :root

  # Overrides Movie resources, order based priority
  get "/movies/index", to: "movies#index", as: ""
  get "/index", to: "movies#index", as: ""
  get "/movies/(.:format)", to: "movies#index", as: ""

  # Movies resources
  resources :movies, only: [:index, :show]

  # Movies show alias
  get "/:id", to: "movies#show", as: ""

end
