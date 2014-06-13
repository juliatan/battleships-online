require_relative 'ship'

class Destroyer < Ship
  def initialize(coordinates)
    raise 'A Destroyer can only cover 2 coordinates' if coordinates.count > 2
    super(coordinates)
  end
end

class Cruiser < Ship
  def initialize(coordinates)
    raise 'A Cruiser can only cover 3 coordinates' if coordinates.count > 3
    super(coordinates)
  end
end

class Submarine < Ship
  def initialize(coordinates)
    raise 'A Submarine can only cover 3 coordinates' if coordinates.count > 3
    super(coordinates)
  end
end

class Battleship < Ship
  def initialize(coordinates)
    raise 'A Battleship can only cover 4 coordinates' if coordinates.count > 4
    super(coordinates)
  end
end

class AircraftCarrier < Ship
  def initialize(coordinates)
    raise 'An AircraftCarrier can only cover 5 coordinates' if coordinates.count > 5
    super(coordinates)
  end
end
