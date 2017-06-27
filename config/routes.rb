Rails.application.routes.draw do
  root 'tweets#index'
  resources :tweets, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      post :confirm
    end
  end
end
