class Triangle
  attr_accessor :side_a, :side_b, :side_c

  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
  end

  def kind
    triangle_sides = [@side_a, @side_b, @side_c].sort
    if triangle_sides.any? { |side| side <= 0 } ||
      triangle_sides[0] + triangle_sides[1] <= triangle_sides[2]
        raise TriangleError
    elsif @side_a + @side_b == 2 * @side_c
      :equilateral
    elsif @side_a == @side_b || @side_a == @side_c || @side_c == @side_b
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
  end
end
