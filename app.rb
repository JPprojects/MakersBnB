require 'sinatra'
require './lib/bnb'
require './lib/db_connection'
require './lib/reservation_id'

class MakersBnB < Sinatra::Base
  enable :sessions
  get '/test' do
    "Hello world"
  end

  get '/' do
    erb :index
  end

  post '/new' do
    session['username'] = params['username']
    redirect '/all'
  end

  get '/all' do
    @username = session['username']
    @places = Bnb.all
    erb :all
  end

  get '/all/reserve/:id' do
    @listing = Bnb.find(id: params[:id])
    erb :edit
  end

  post '/all/:id' do
    dev = Bnb.reserve(id: params[:id], place: params[:place], reservation_status: 'requested')
    p dev
    redirect '/all/confirmed_reservation'
  end

  post '/all/approve/:id' do
    Bnb.reserve(id: params[:id], place: params[:place], reservation_status: 'reserved')
    redirect '/all'
  end

  get '/all/confirmed_reservation' do
    @username = session['username']
    @id = ReservationId.randomize
    erb :reservation
  end

  get '/add_place' do
    erb :add_place
  end

  post '/add_place_post' do
    Bnb.create( user_name: session['username'] , place: params['place'], description: params['description'], fixed_price: params['fixed_price'], date_from: params['date_from'], date_to: params['date_to'])
    redirect '/all'
  end

  run! if app_file == $0
end
