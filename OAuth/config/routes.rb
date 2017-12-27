root 'home#index'
get  "home/index" #=> 'home/index'
get  '/auth/:provider/callback',      :to => 'sessions#callback'
post '/auth/:provider/callback',      :to => 'sessions#callback'
get  '/logout' => 'sessions#destroy', :as => :logout

get "/tweet",        :to => 'home#tweet',        :as => 'tweet'
get "/follow",       :to => 'home#follow',       :as => 'follow'
get "/follow_check", :to => 'home#follow_check', :as => 'follow_check'

map.root:controller => 'index'
map.connect ':action', :controller => 'index'

