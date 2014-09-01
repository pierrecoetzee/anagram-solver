AnagramSolver::Application.routes.draw do

  match 'logout' => 'login#logout', :as => 'logout'
  match 'login' => 'login#index', :as => 'login'
  match 'authenticate' => 'login#authenticate', :as => 'authenticate'

  get 'home/words', to: 'home#anagram_word_lookup', defaults: { format: 'json' }, as: 'anagram'
  match 'home' => 'home#index', as: 'home'
  
  root :to => 'login#index'
  
end
