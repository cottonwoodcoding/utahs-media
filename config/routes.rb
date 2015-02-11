Rails.application.routes.draw do

  get 'contact', to: 'contact#index'
  get 'gallery', to: 'gallery#index'
  get 'service', to: 'service#index'
  get 'product', to: 'product#index'
  get 'about',   to: 'about#index'

  root 'home#index'

end
