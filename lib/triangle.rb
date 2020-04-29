class Triangle
  #I need to define an error for when something is not a triangle
  class TriangleError < StandardError
    def message 
      "That is not a triangle"
    end
  end

  attr_reader :side_one_length, :side_two_length, :side_three_length, :kind
  # A triangle needs to be initialized with 3 sides
  def initialize(side_one_length, side_two_length, side_three_length)
    @side_one_length = side_one_length
    @side_two_length = side_two_length
    @side_three_length = side_three_length
    #I find working with an array of the three sides easier than working with the instance variables
    triangle_sides = []
    triangle_sides << @side_one_length
    triangle_sides << @side_two_length
    triangle_sides << @side_three_length
    #No sides of a triangle may be equal to zero
    if triangle_sides.any?{|side| side <= 0}
      raise TriangleError
    #The sum of the lengths of any two sides of a triangle always
    #exceeds the length of the third side. I have to check
    #to see if this is true, and if not I need to raise a 
    #TriangleError
    elsif (triangle_sides[0] + triangle_sides[1] <= triangle_sides[2]) || (triangle_sides[1] + triangle_sides[2] <= triangle_sides[0]) || (triangle_sides[0] + triangle_sides[2] <= triangle_sides[1])
       raise TriangleError
    # An equilateral triangle has all sides equal
    elsif triangle_sides.all?{|side| side == triangle_sides[0]}
      @kind =  :equilateral 
    #An isosceles triangle has 2 sides that are equal, so here I'm checking to see that any two sides are equal.
    elsif triangle_sides[1] == triangle_sides[2] || triangle_sides[0] == triangle_sides[2] || triangle_sides[0] == triangle_sides[1]
      @kind = :isosceles
      #scalene triangles have no equal sides. Similar to what I just did but instead they cannot be equal
    elsif (triangle_sides[0] != triangle_sides[1] || triangle_sides[2]) && (triangle_sides[1] != triangle_sides[2])
      @kind = :scalene
    end
  end
end
