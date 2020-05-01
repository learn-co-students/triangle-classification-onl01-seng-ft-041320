class Triangle
  attr_accessor :a, :b, :c

#Each argument is a length of one of the three sides of the triangle.

  def initialize a, b, c
    @a = a
    @b = b
    @c = c
  end

  def kind
    if a <= 0 || b <= 0 || c <= 0 ||
      a + b <= c || b + c <= a || a + c <= b
    #  begin
        raise TriangleError
    #  rescue TriangleError => error
    #      puts error.message
    #  end
    elsif a == b && b == c
      :equilateral
    elsif a == b || c == b || a == c
      :isosceles
    else a != b && c != b && a != c
      :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "The sum of the length of any two sides of a triangle must be greater than the third."
    end
  end
end


#Triangle.new(0, -1, 1).kind
