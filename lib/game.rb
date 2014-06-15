require_relative 'coordinate'
require_relative 'coordinates'
require_relative 'ship'
require_relative 'ships'

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

def current_board
  session[:current_board] ||= 
  ["","","","","","","","","","",
  "","","","","","","","","","",
  "","","","","","","","","","",
  "","","","","","","","","","",
  "","","","","","","","","","",
  "","","","","","","","","","",
  "","","","","","","","","","",
  "","","","","","","","","","",
  "","","","","","","","","","",
  "","","","","","","","","",""]
  session[:current_board]
end

def translator
  @translator ||= {
  0 => "A1", 1 => "A2", 2 => "A3", 3 => "A4", 4 => "A5", 5 => "A6", 6 => "A7",
  7 => "A8", 8 => "A9", 9 => "A10", 
  10 => "B1", 11 => "B2", 12 => "B3", 13 => "B4", 14 => "B5", 15 => "B6", 
  16 => "B7", 17 => "B8", 18 => "B9", 19 => "B10", 
  20 => "C1", 21 => "C2", 22 => "C3", 23 => "C4", 24 => "C5", 25 => "C6", 
  26 => "C7", 27 => "C8", 28 => "C9", 29 => "C10", 
  30 => "D1", 31 => "D2", 32 => "D3", 33 => "D4", 34 => "D5", 35 => "D6", 
  36 => "D7", 37 => "D8", 38 => "D9", 39 => "D10", 
  40 => "E1", 41 => "E2", 42 => "E3", 43 => "E4", 44 => "E5", 45 => "E6", 
  46 => "E7", 47 => "E8", 48 => "E9", 49 => "E10", 
  50 => "F1", 51 => "F2", 52 => "F3", 53 => "F4", 54 => "F5", 55 => "F6",
  56 => "F7", 57 => "F8", 58 => "F9", 59 => "F10", 
  60 => "G1", 61 => "G2", 62 => "G3", 63 => "G4", 64 => "G5", 65 => "G6", 
  66 => "G7", 67 => "G8", 68 => "G9", 69 => "G10",
  70 => "H1", 71 => "H2", 72 => "H3", 73 => "H4", 74 => "H5", 75 => "H6", 
  76 => "H7", 77 => "H8", 78 => "H9", 79 => "H10", 
  80 => "I1", 81 => "I2", 82 => "I3", 83 => "I4", 84 => "I5", 85 => "I6",
  86 => "I7", 87 => "I8", 88 => "I9", 89 => "I10", 
  90 => "J1", 91 => "J2", 92 => "J3", 93 => "J4", 94 => "J5", 95 => "J6", 
  96 => "J7", 97 => "J8", 98 => "J9", 99 => "J10"
  }
  @translator
end

get '/play' do
  current_board
  translator
  erb :play, :layout => :layout
end

post '/battleship' do
  ac1 = Coordinate.new(params[:aircraft1])
  ac2 = Coordinate.new(params[:aircraft2])
  ac3 = Coordinate.new(params[:aircraft3])
  ac4 = Coordinate.new(params[:aircraft4])
  ac5 = Coordinate.new(params[:aircraft5])

  ac_coordinates = Coordinates.new(ac1,ac2,ac3,ac4,ac5)
  aircraft_carrier = AircraftCarrier.new(ac_coordinates)

  string_coords = []
  string_coords << params[:aircraft1] << params[:aircraft2] << params[:aircraft3] << params[:aircraft4] << params[:aircraft5]

  array_position = []

  translator.each do |key, value|
    string_coords.each do |coord|
      if value == coord
        array_position << key
      end
    end
  end

  array_position.map do |position|
    current_board[position] = "S"
  end

  erb :battleship, :layout => :layout
end

post '/submarine' do
  b1 = Coordinate.new(params[:battleship1])
  b2 = Coordinate.new(params[:battleship2])
  b3 = Coordinate.new(params[:battleship3])
  b4 = Coordinate.new(params[:battleship4])

  b_coordinates1 = Coordinates.new(b1,b2,b3,b4)
  battleship1 = Battleship.new(b_coordinates1)

  b5 = Coordinate.new(params[:battleship5])
  b6 = Coordinate.new(params[:battleship6])
  b7 = Coordinate.new(params[:battleship7])
  b8 = Coordinate.new(params[:battleship8])

  b_coordinates2 = Coordinates.new(b5,b6,b7,b8)
  battleship2 = Battleship.new(b_coordinates2)

  string_coords = []
  string_coords << params[:battleship1] << params[:battleship2] << params[:battleship3] << params[:battleship4]
  string_coords << params[:battleship5] << params[:battleship6] << params[:battleship7] << params[:battleship8]

  array_position = []

  translator.each do |key, value|
    string_coords.each do |coord|
      if value == coord
        array_position << key
      end
    end
  end

  array_position.map do |position|
    current_board[position] = "S"
  end

  erb :submarine, :layout => :layout
end

post '/cruiser' do
  s1 = Coordinate.new(params[:submarine1])
  s2 = Coordinate.new(params[:submarine2])
  s3 = Coordinate.new(params[:submarine3])

  s_coordinates1 = Coordinates.new(s1,s2,s3)
  submarine1 = Submarine.new(s_coordinates1)
  
  s4 = Coordinate.new(params[:submarine4])
  s5 = Coordinate.new(params[:submarine5])
  s6 = Coordinate.new(params[:submarine6])

  s_coordinates2 = Coordinates.new(s4,s5,s6)
  submarine2 = Submarine.new(s_coordinates2)

  string_coords = []
  string_coords << params[:submarine1] << params[:submarine2] << params[:submarine3]
  string_coords << params[:submarine4] << params[:submarine5] << params[:submarine6]

  array_position = []

  translator.each do |key, value|
    string_coords.each do |coord|
      if value == coord
        array_position << key
      end
    end
  end

  array_position.map do |position|
    current_board[position] = "S"
  end

  erb :cruiser, :layout => :layout
end

post '/destroyer' do
  c1 = Coordinate.new(params[:cruiser1])
  c2 = Coordinate.new(params[:cruiser2])
  c3 = Coordinate.new(params[:cruiser3])

  c_coordinates1 = Coordinates.new(c1,c2,c3)
  cruiser1 = Cruiser.new(c_coordinates1)

  c4 = Coordinate.new(params[:cruiser4])
  c5 = Coordinate.new(params[:cruiser5])
  c6 = Coordinate.new(params[:cruiser6])
 
  c_coordinates2 = Coordinates.new(c4,c5,c6)
  cruiser2 = Cruiser.new(c_coordinates2)

  string_coords = []
  string_coords << params[:cruiser1] << params[:cruiser2] << params[:cruiser3]
  string_coords << params[:cruiser4]<< params[:cruiser5] << params[:cruiser6]

  array_position = []

  translator.each do |key, value|
    string_coords.each do |coord|
      if value == coord
        array_position << key
      end
    end
  end

  array_position.map do |position|
    current_board[position] = "S"
  end

  erb :destroyer, :layout => :layout
end

post '/ships' do
  d1 = Coordinate.new(params[:destroyer1])
  d2 = Coordinate.new(params[:destroyer2])

  d_coordinates1 = Coordinates.new(d1,d2)
  destroyer1 = Destroyer.new(d_coordinates1)

  d3 = Coordinate.new(params[:destroyer3])
  d4 = Coordinate.new(params[:destroyer4])

  d_coordinates2 = Coordinates.new(d3,d4)
  destroyer2 = Destroyer.new(d_coordinates2)

  d5 = Coordinate.new(params[:destroyer5])
  d6 = Coordinate.new(params[:destroyer6])
  
  d_coordinates3 = Coordinates.new(d5,d6)
  destroyer3 = Destroyer.new(d_coordinates3)

  d7 = Coordinate.new(params[:destroyer7])
  d8 = Coordinate.new(params[:destroyer8])
  
  d_coordinates4 = Coordinates.new(d7,d8)
  destroyer4 = Destroyer.new(d_coordinates4)

  string_coords = []
  string_coords << params[:destroyer1] << params[:destroyer2]
  string_coords << params[:destroyer3] << params[:destroyer4]
  string_coords << params[:destroyer5] << params[:destroyer6]
  string_coords << params[:destroyer7] << params[:destroyer8]

  array_position = []

  translator.each do |key, value|
    string_coords.each do |coord|
      if value == coord
        array_position << key
      end
    end
  end

  array_position.map do |position|
    current_board[position] = "S"
  end

  erb :ships, :layout => :layout
end

get '/shoot' do
  erb :shoot, :layout => :layout
end