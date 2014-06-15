class Ship
  attr_reader :coordinates, :hits

  def initialize(coordinates)
    @coordinates = coordinates
    @hits = []
  end

  def hit(coordinate)
    @hits << coordinate if can_be_hit_at?(coordinate)
    self
  end

  def hit?
    hits.any?
  end
  
  def sunk?
    hits.count == coordinates.count
  end

  def can_be_hit_at?(coordinate)
    coordinates.include?(coordinate) && !hits.include?(coordinate)
  end
end
