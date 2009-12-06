ActionController::Routing::Routes.draw do |map|
  # map.resources :alerts

  map.resources :contracts, :collection => { :alerts => :get } 
  
   map.root :controller => :contracts
  # map.root :controller => 'contracts'
  # map.resources :contracts, :has_many => :alerts
  map.resources :credits
  map.resources :users do |user|
    user.resources :posts do |post|
      post.resources :comments
    end
  end
  

end
