class Triangle
  
  # :sides is an array holding three side length integers.
  attr_accessor :sides

  def initialize(side_one, side_two, side_three)
    @sides = []
    @sides << side_one
    @sides << side_two
    @sides << side_three
  end

  def inequality?()
    
    # checks to see whether the sides are of valid length
    if !(@sides[0] <= 0 || @sides[1] <= 0 || @sides[2] <= 0)
      # 1 + 2 > 3
      # 1 + 3 > 2
      # 2 + 3 > 1
      # there's gotta be a prettier way of writing this if statement...
      if (@sides[0] + @sides[1] > @sides[2]) && (@sides[0] + @sides[2] > @sides[1]) && (@sides[1] + @sides[2] > @sides[0])
        return false
      end
    end

    true
  end

  def equilateral?()
    if (@sides[0] == @sides[1]) && (@sides[1] == @sides[2])
      return true
    end

    false
  end

  def isosceles?()
    if (@sides[0] == @sides[1]) || (@sides[0] == @sides[2]) || (@sides[1] == @sides[2])
      return true
    end

    false
  end

  def kind()

    if inequality?
      raise TriangleError
    elsif equilateral?
      return :equilateral
    elsif isosceles?
      return :isosceles
    else # scalene? check is not needed since there are no other options for a valid triangle
      return :scalene
    end
    
  end

  class TriangleError < StandardError
    def message
      puts "This triangle is invalid!"
    end
  end

end
