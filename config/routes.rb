ActionController::Routing::Routes.draw do |map|
    map.root :controller => 'users'
  
      map.resources :users do |user|
    user.resources :posts do |post|
      post.resources :comments
    end
  end
  
end
