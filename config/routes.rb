Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#welcome'
  get '/createbot/intro', to: 'home#createbot_intro'
  get '/selectbot', to: 'home#selectbot'
  #bot editing part
  get '/botsettings/:id', to: 'home#botsettings', as: 'botsettings'
  get '/composemessage/:id', to: 'home#composemessage',as: 'composemessage'
  get '/activatebot/:id', to: 'home#activatebot', as: 'activatebot'
  #bot info part
  get '/statistics/:id', to: 'home#statistics', as: 'statistics'
  get '/testbot/:id', to: 'home#testbot', as: 'testbot'
  resources :bots
  put 'active/:id', to: 'active#updateactive', as: 'bot_active'
end

