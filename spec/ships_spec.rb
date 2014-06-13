require 'ship'
require 'ships'

describe Ship do
  it_behaves_like 'a ship'
end

describe Destroyer do
  it_behaves_like 'a ship'

  it 'can only cover 2 coordinates' do
    expect{Destroyer.new([1,2,3])}.to raise_error 'A Destroyer can only cover 2 coordinates'
  end
end

describe Cruiser do
  it_behaves_like 'a ship'

  it 'can only cover 3 coordinates' do
    expect{Cruiser.new([1,2,3,4])}.to raise_error 'A Cruiser can only cover 3 coordinates'
  end
end

describe Submarine do
  it_behaves_like 'a ship'

  it 'can only cover 3 coordinates' do
    expect{Submarine.new([1,2,3,4])}.to raise_error 'A Submarine can only cover 3 coordinates'
  end
end

describe Battleship do
  it_behaves_like 'a ship'

  it 'can only cover 4 coordinates' do
    expect{Battleship.new([1,2,3,4,5])}.to raise_error 'A Battleship can only cover 4 coordinates'
  end
end

describe AircraftCarrier do
  it_behaves_like 'a ship'

  it 'can only cover 5 coordinates' do
    expect{AircraftCarrier.new([1,2,3,4,5,6])}.to raise_error 'An AircraftCarrier can only cover 5 coordinates'
  end
end
