Rails.application.routes.draw do

  get 'leaderboards/lgenre/:id' ,to: 'leaderboards#lgenre'

  get 'leaderboards/lsub_genre/:id', to: 'leaderboards#lsub_genre'

  get 'leaderboards/lquiz/:id' ,to: 'leaderboards#lquiz'

  post 'games/remove/:id' => 'games#remove'  
  get 'games/remove/:id' => 'games#remove'  
  
  patch 'games/remove/:id' => 'games#remove'

  post 'questions/destroy/:id', to: 'questions#destroy'
  delete  'questions/:id', to: 'questions#destroy'
  
  get 'games/new'

  post 'games/play'

  get 'sub_genres/new'

  get '/subgenre' ,to: 'sub_genres#new' 
  
  post '/subgenre' ,to: 'sub_genres#create' 

  get 'genres/new'

  get 'quizes/new'

  get '/quiz' ,to: 'quizes#new'

  post '/quiz' ,to: 'quizes#create'

  get 'questions/new'
  
  get 'sessions/new'

  root 'static_pages#Home'

  get 'users/new'

  get '/SignUp' , to: 'users#new'

  get '/about' , to: 'static_pages#about'

  post '/SignUp',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'

  delete '/logout',  to: 'sessions#destroy'

  get '/questions', to: 'questions#new' 

  post '/questions', to: 'questions#create' 

  patch '/questions/:id', to: 'questions#update' 

  resources :users  
  resources :questions
  resources :genres
  resources :sub_genres
  resources :quizes
  resources :games
  resources :leaderboards
end
