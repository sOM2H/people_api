Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'pages#index'

  post 'TicTacToe/single' => 'tic_tac_toe#single'
  post 'SeaBattle/single' => 'sea_battle#single'

  post 'TicTacToe/multi' => 'tic_tac_toe#multi'
  post 'SeaBattle/multi' => 'sea_battle#multi'
end
