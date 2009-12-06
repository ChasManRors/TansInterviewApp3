ActionController::Routing::Routes.draw do |map|

  
   map.root :controller => :contracts
  # map.root :controller => 'contracts'
  map.resources :contracts
  map.resources :credits
  map.resources :users do |user|
    user.resources :posts do |post|
      post.resources :comments
    end
  end
  

end
