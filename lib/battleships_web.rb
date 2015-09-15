require 'sinatra/base'

class BattleshipWeb < Sinatra::Base

  set :views, proc { File.join(root, 'views') }

  get '/' do
    erb :index
  end

  get '/new_game' do
    @player = params[:name]
    erb :new_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
