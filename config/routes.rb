Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  # get 'welcome/index'

  # Разделение видимости на admin и пользователей
  namespace :admin do

    # Создаем вызов своего экшена, on: :member - работает с отдельным объектом (для коллекции - on: :collection)
    resources :railway_stations do
      patch :update_position, on: :member
    end

    # get 'carriages/new' => 'carriages#new'
    resource :carriages, only: [:new, :create]

    # Добавление вагонов через вложенный ресурс
    resources :trains do
      resources :carriages, shallow: true
    end

    resources :carriages
  end

  # Относятся к пользовательской части:
  resource :search, only: [:new, :create, :show, :edit]
  resources :tickets do
    post :new, on: :member
  end
  resources :routes

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
