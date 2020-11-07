Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#welcome'
  get '/createbot/intro', to: 'home#createbot_intro'
  get '/createbot/:id', to: 'home#createbotedit', as: 'createbotedit'
  put '/createbot/update/:id', to: 'home#createbotupdate', as: 'createbotupdate'
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
  #compose message
  get 'triggerphrase/edit/:id' , to: 'active#triggerphraseedit' , as: 'triggerphraseedit'
  get 'triggerphrase/confirm/:id' , to: 'active#triggerphraseconfirm' , as: 'triggerphraseconfirm'
  post 'triggerphrase/create/:id' , to: 'active#triggerphrasecreate' , as: 'triggerphrasecreate'
  delete 'triggerphrase/delete/:id/:botid' , to: 'active#triggerphrasedelete' , as: 'triggerphrasedelete'
  #nodes
  post 'nodes/create/:botid/:parentid/:nodetype' , to: 'nodes#create' , as: 'nodescreate'
  delete 'nodes/destroy/:id' , to: 'nodes#destroy' , as: 'nodes_destroy'
  post 'nodes/message_create' , to: 'nodes#message_create' , as: 'nodes_message_create'
  delete 'nodes/message_delete/:msg_id/:bot_id/:node_id', to: 'nodes#message_delete', as: 'nodes_message_delete'
  put 'nodes/update_options/:bot_id/:node_id', to: 'nodes#update', as: 'nodes_update_options'
  get 'nodes/expand/:bot_id/:node_id', to: 'nodes#expand', as: 'nodes_expand'
  get 'nodes/number_of_nodes_increment', to: 'nodes#increment', as: 'number_of_nodes_increment'
  get 'nodes/number_of_nodes_decrement', to: 'nodes#decrement', as: 'number_of_nodes_decrement'
  post 'nodes/add_numberof_nodes/:botid/:parentid/:nodetype', to: 'nodes#add_number_of_nodes', as: 'add_number_of_nodes'
  delete 'nodes/usermessage_node_delete/:id', to: 'nodes#usermessage_node_delete', as: 'usermessage_node_delete'
  get 'nodes/define_nodes/:id', to: 'nodes#define_nodes', as: 'define_nodes'
end

