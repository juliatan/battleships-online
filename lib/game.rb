enable :sessions
use Rack::Session::Pool, :expire_after => 60000

# not needed since running sinatra gem from outside the lib folder
# set :views, Proc.new { File.join(root, '..', "views")}
# set :public_folder, Proc.new{File.join(root,'..','public')}

get '/' do
  erb :index, :layout => :layout
end

post '/register' do
  session[:users] ||= 0
  session[:users] += 1
  erb :register, :layout => :layout
end

get '/play' do
  erb :play, :layout => :layout
end