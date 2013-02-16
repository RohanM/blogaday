Blogaday::Application.routes.draw do
  resources :posts
  match '/feed' => 'posts#feed', :as => :feed, :defaults => { :format => 'atom' }
end
