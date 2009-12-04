ActionController::Routing::Routes.draw do |map|
  map.resources :credits
  
  map.root :controller => 'users'
  
  map.resources :users do |user|
    user.resources :posts do |post|
      post.resources :comments
    end
  end
  

end
