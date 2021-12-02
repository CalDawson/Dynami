Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :meal_eatens, only: %i[index destroy edit update new create] do
    resources :posts, only: %i[new create]
  end
  
  resources :meals, only: %i[new create destroy edit update index show] do
    resources :meal_contents, only: %i[new create destroy]
  end

  resources :workout_sessions, only: %i[index destroy edit update new create show] do
    resources :posts, only: %i[new create]
  end

  resources :workouts, only: %i[create destroy edit update show] do
    resources :workout_exercises, only: %i[new create]
  end

  resources :workout_exercises, only: %i[edit update destroy]

  resources :posts, only: %i[show destroy index] do
    resources :comments, only: %i[create destroy]
  end

  resources :chatrooms, only: %i[show index] do
    resources :messages, only: %i[create destroy]
  end

  resources :users, only: %i[] do
    resources :chatrooms, only: %i[create]
  end
end
