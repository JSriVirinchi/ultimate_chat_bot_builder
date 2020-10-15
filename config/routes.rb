Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#landing'
  get '/welcome', to: 'home#welcome'
  get '/createbot/intro', to: 'home#createbot_intro'
  get '/selectbot', to: 'home#selectbot'
  get '/botsettings', to: 'home#botsettings'
  get '/composemessage', to: 'home#composemessage'
  get '/activatebot', to: 'home#activatebot'
  resources :bots
end
