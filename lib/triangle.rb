require 'pry'
class Triangle
  def initialize(side_1, side_2, side_3)
    @triangle_sides = []
    @triangle_sides << side_1
    @triangle_sides << side_2
    @triangle_sides << side_3
  end

  # def valid?
  #   sum_one_two = @triangle_sides[0] + @triangle_sides[1]
  #   sum_one_three = @triangle_sides[0] + @triangle_sides[2]
  #   sum_two_three = @triangle_sides[1] + @triangle_sides[2]
  # end

  def kind
    @triangle_sides = @triangle_sides.sort 
    if (@triangle_sides[0] + @triangle_sides[1] <= @triangle_sides[2]) || (@triangle_sides[0] <= 0 || @triangle_sides[1] <= 0 || @triangle_sides[2] <= 0)
      raise TriangleError
    else
      if (@triangle_sides[0] == @triangle_sides[1] && @triangle_sides[1] == @triangle_sides[2])
        :equilateral
      elsif (@triangle_sides[0] == @triangle_sides[1] || @triangle_sides[0] == @triangle_sides[2] || @triangle_sides[1] == @triangle_sides[2])
        :isosceles
      else
        :scalene
      end
    end
  end

  class TriangleError < StandardError

  end
end


 