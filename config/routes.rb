Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get    '/commands'          => 'commands#index'
  get    '/commands/new'      => 'commands#new'
  get    '/commands/display'      => 'commands#display'
  get    '/commands/:id'      => 'commands#show'
  post   '/commands'          => 'commands#create'
  get    '/commands/:id/edit' => 'commands#edit'
  get	 '/commands/:id/execute' => 'commands#execute'
  patch  '/commands/:id'      => 'commands#update'
  put    '/commands/:id'      => 'commands#update'
  delete '/commands/:id'      => 'commands#destroy'

end
