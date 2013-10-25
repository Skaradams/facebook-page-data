Tigerlily::Application.routes.draw do
  root to: "home#index"

  resources :pages, only: [:create, :destroy, :show]
end
