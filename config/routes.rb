Rails.application.routes.draw do
  root 'home#index'

  get 'contact', to: 'contact#index'
  get 'gallery', to: 'gallery#index'
  get 'service', to: 'service#index'
  get 'product', to: 'product#index'
  get 'about',   to: 'about#index'

  post '/send_feedback', to: 'contact#send_feedback'
end
