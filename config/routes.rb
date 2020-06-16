Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :shifts, only: [:create, :update, :destroy]
  get "shift-new", to: "shifts#new", as: :shift_new
  get "shift-answer", to: "shifts#answer", as: :shift_answer
  resources :exchanges, only: [:create, :update]
  get "dashboard", to: "dashboards#home", as: :dashboard
  get "supervise", to: "supervise#home", as: :supervise
  get "supervise/stat", to: "supervise#stat", as: :stat
end
