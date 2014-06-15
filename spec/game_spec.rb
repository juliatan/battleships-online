require 'game'
require 'rack/test'

describe Game do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'says hello' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq 'Hello world!'
  end

end