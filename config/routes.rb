Rails.application.routes.draw do
  get 'items/index'
  get 'items/show'
  get 'items/new'
  get 'items/edit'
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'orders/edit'
  get 'customers/index'
  get 'customers/show'
  get 'customers/new'
  get 'customers/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
