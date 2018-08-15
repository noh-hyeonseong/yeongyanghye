Rails.application.routes.draw do
  resource :calendar, only: [:show], controller: :calendar
  get 'calendar/show'

  root 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :nutritions
  resources :questions do
    resources :question_comments, only: [:create, :destroy]
    post "/question_like", to: "question_likes#like_toggle"
    resources :answers, except: [:index, :show] do
      resources :answer_comments, only: [:create, :destroy]
      post "/answer_like", to: "answer_likes#like_toggle"
      post "/select_answer", to: "answers#select_answer"
    end
  end
  resources :magazines do
    post "/magazinelikes", to: "magazinelikes#like_toggle"
    resources :magazine_comments, only: [:create, :destroy]
  end
  
  resources :frees do
    post "/freelikes", to: "freelikes#like_toggle"
    resources :free_comments, only: [:create]
  end

  # CalendarExample::Application.routes.draw do
  get 'calendar/show'

  #   resource :calendar, only: [:show], controller: :calendar
  #   root to: "calendar#show"
  # end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
