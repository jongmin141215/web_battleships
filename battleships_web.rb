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
    erb :new_game
  end

  get '/initialize_game' do
    @game = Game.new
    @player = Player.new
    @game.add_player(@player)
    @board = Board.new(Cell)
    @patrol = Ship.patrol_boat
    @aircraft = Ship.aircraft_carrier
    @battleship = Ship.battleship
    @destroyer = Ship.destroyer
    @submarine = Ship.submarine
    @result = @board.print_board
    erb :initialize_game

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
