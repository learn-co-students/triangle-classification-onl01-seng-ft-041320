class Triangle
  attr_accessor :side_a, :side_b, :side_c, :sides

  def initialize(side_a, side_b, side_c)
    self.side_a = side_a
    self.side_b = side_b
    self.side_c = side_c
    self.sides = [side_a, side_b, side_c].sort
  end

  def kind
    if sides.any? { |side| side <= 0 } || sides[0] + sides[1] <= sides[2]
      raise TriangleError
    elsif side_a == side_b && side_b == side_c
      :equilateral
    elsif side_a == side_b || side_a == side_c || side_b == side_c
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
  end
end
