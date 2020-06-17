Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :shifts, only: [:create, :update, :destroy]
  get "shift-new", to: "shifts#new"
  resources :exchanges, only: [:create, :update]
  get "dashboard", to: "dashboards#home", as: :dashboard
  get "supervise", to: "supervises#home", as: :supervise
  get "supervise/stat", to: "supervises#stat", as: :stat
  get "dashboard/my-shifts", to: "dashboards#my_shifts", as: :my_shifts
  get "dashboard/my-answers", to: "dashboards#my_answers", as: :my_answers
  get "dashboard/:shift_id/shift-answer", to: "shifts#answer", as: :shift_answer
end
