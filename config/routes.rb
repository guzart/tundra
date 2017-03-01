Rails.application.routes.draw do
  post 'user_token', to: 'user_token#create'

  namespace :reporting do
    resources :inspectors, only: [] do
      post 'reports', action: :create_report, on: :member
    end
  end
end
