require "pry"

class Triangle
  attr_accessor :a, :b, :c
  def initialize(a, b, c)
    @a= a
    @b= b
    @c= c
  end
 
  def valid?
    if a + b > c && a > 0 && b > 0 && c > 0 && a + c > b && b + c > a
      true
    else
      #begin
      raise TriangleError
      #rescue TriangleError => error
        #binding.pry
        #puts error.message
      #end
    end
  end
  
  def identify
    if self.valid?
      if a != b && b != c && a != c
        :scalene 
      elsif a == b && b == c
        :equilateral
      elsif a != b && b == c
        :isosceles
      elsif a == b && b != c
        :isosceles
      elsif a != b && a == c
        :isosceles
      end
    else
      "invalid"
    end
  end 

    def kind
      self.identify
    end

    class TriangleError < StandardError
      def message
        "you must enter a valid triangle"
      end
    end
  
  end

  


