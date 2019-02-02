Rails.application.routes.draw do
	
  resources :shops
  patch 'shops/:id/add_to_stock' => "shops#add_to_stock", as: 'add_to_stock'
  patch '/shelves/:id/add_one_candy' => 'shelves#add_one_candy', as: 'add_one_candy'
  patch '/shelves/:id/remove_one_candy' => 'shelves#remove_one_candy', as: 'remove_one_candy'
  delete '/shelves/:id/remove_all_candy' => 'shelves#remove_all_candy', as: 'remove_all_candy'
  resources :shelves
  resources :candies

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
