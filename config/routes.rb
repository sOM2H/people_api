Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'pages#index'

  post 'TicTacToe/single' => 'tic_tac_toe#single'
  post 'SeaBattle/single' => 'sea_battle#single'

  post 'TicTacToe/multi_generate' => 'tic_tac_toe#multi_generate'
  post 'TicTacToe/multi_accept' => 'tic_tac_toe#multi_accept'

  post 'SeaBattle/multi_generate' => 'sea_battle#multi_accept'
  post 'SeaBattle/multi_accept' => 'sea_battle#multi_accept'
end
