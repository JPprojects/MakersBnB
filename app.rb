require 'sinatra'

class MakersBnB < Sinatra::Base
  get '/test' do
    "Hello world"
  end

  run! if app_file == $0
end 
