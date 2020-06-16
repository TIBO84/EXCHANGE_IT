Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :shifts, only: [:create, :update, :destroy]
  get "shift-new", to: "shifts#new", as: :shift_new
  resources :exchanges, only: [:create, :update]
  get "dashboard", to: "dashboards#home", as: :dashboard
  get "supervise", to: "supervise#home", as: :supervise
  get "supervise/stat", to: "supervise#stat", as: :stat
  get "my-shifts", to: "dashboard#my_shifts", as: :my_shifts
  get "my-answers", to: "dashboard#my_answers", as: :my_answers
  get "dashboard/:shift_id/shift-answer", to: "shifts#answer", as: :shift_answer
end
