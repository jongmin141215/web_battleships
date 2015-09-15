require 'sinatra/base'
require './lib/board'
require './lib/ship'
require './lib/game'
require './lib/player'
require './lib/water'
require './lib/cell'

class BattleshipWeb < Sinatra::Base

  enable :sessions
  set :views, proc { File.join(root, 'views') }

  get '/' do
    erb :index
  end

  get '/new_game' do
    @player = params[:name]
    # session[:name] = @player
    erb :new_game
  end

  get '/initialize_game' do
    p @game = Game.new
    p @player = Player.new
    p @game.add_player(@player)
    p @board = Board.new(Cell)
    erb :initialize_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
