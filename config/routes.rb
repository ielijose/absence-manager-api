Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :absences
    end
  end
  namespace :api do
    namespace :v1 do
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: proc { [200, {}, ["200 OK"]] }
end
