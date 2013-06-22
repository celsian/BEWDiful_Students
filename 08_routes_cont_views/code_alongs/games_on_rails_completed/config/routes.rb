GamingApp::Application.routes.draw do
  root "games#index"
  get '/games', to: 'games#index'
  get '/games/magic_8_ball', to: 'games#magic_8_ball', as: "magic_8_ball"
  get '/games/magic_8_ball/:question', to: 'games#magic_8_ball_play', as: 'magic_8_ball_play'
  get '/games/secret_number', to: 'games#secret_number', as: "secret_number"
  get '/games/secret_number/:guess', to: 'games#secret_number_play', as: "secret_number_play"
  get '/games/rock_paper_scissors', to: 'games#rock_paper_scissors', as: "rps"
  get '/games/rock_paper_scissors/:throw', to: 'games#rock_paper_scissors_throw', as: "rps_throw"

  get '/blackjack', to: 'blackjack#index'
  get '/blackjack/play', to: 'blackjack#play', as: "bj"
  get '/blackjack/hit', to: 'blackjack#hit', as: "bj_hit"
  get '/blackjack/stay', to: 'blackjack#stay', as: "bj_stay"





  # get '/games/rock_paper_scissors/', to: 'games#rock_paper_scissors', as: "rps"
  # get '/games/rock_paper_scissors/:throw', to: 'games#rock_paper_scissors_play', as: 'rps_play'
end
