require 'sinatra/base'
require './lib/peeps'
class Chitter < Sinatra::Base


  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :'chitter/index'
  end

  get '/peeps/new' do
    erb :'chitter/new'
  end

  post '/peeps' do
    Peeps.create(message: params[:message], username: params[:username])
    redirect '/peeps'
  end

  run! if app_file == $0
end
