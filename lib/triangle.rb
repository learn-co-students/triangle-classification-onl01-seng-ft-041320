class Triangle
  # write code here
  
  attr_reader :right, :left, :bottom
  
  def initialize(right, left, bottom)
    @right = right
    @left = left
    @bottom = bottom
  end
  
  def kind
    
    if (right + left <= bottom) || (right + bottom <= left) || (left + bottom <= right) || (right <= 0) || (left <= 0) || (bottom <= 0)
      
      raise TriangleError
    end
      
      
    if right == left && left == bottom && right == bottom
      :equilateral
    elsif right == left || left == bottom || right == bottom 
      :isosceles
    else
      :scalene
    end
  end
  
  
  class TriangleError < StandardError
  end
end
