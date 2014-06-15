require 'game'
require 'rack/test'

describe "Game Server" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'says hello' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq 'Welcome to Battleships!'
  end

  it 'allows the user to input their name' do
    post '/register', params={name: "Sam"}
    expect(last_response).to be_ok
    expect(last_response.body).to eq "Welcome Sam! There's 1 players."
  end

  it 'stores two users in one session' do
    post '/register', params={name: "Sam"}
    post '/register', params={name: "Jon"}
    expect(last_response).to be_ok
    expect(last_response.body).to eq "Welcome Jon! There's 2 players."
  end

end