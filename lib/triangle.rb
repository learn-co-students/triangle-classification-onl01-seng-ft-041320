require "pry"
class Triangle
  # write code here
  # triangle class accepts three arguments on initialization
  attr_accessor :a_length, :b_length, :c_length

  def initialize(a_length, b_length, c_length)
    #create instance variables to house arrary lengths
    @a_length = a_length
    @b_length = b_length
    @c_length = c_length

  end
  
  def kind
    #error section
    triangle_array = [self.a_length, self.b_length, self.c_length]
    if triangle_array.any?{|side| side == 0}
      binding.pry
      begin
        raise TriangleError
      # rescue TriangleError => error
      #   puts error.message
      end
    elsif triangle_array.any?{|side| side < 0}
      begin
        raise TriangleError
      # rescue TriangleError => error
      #   puts error.message
      end
    elsif (self.a_length + self.c_length <= self.b_length) || (self.b_length + self.a_length <= self.c_length) || (self.b_length + self.c_length <= self.a_length)
      begin 
        raise TriangleError
      # rescue TriangleError => error
      #   puts error.message
      end
    else
      if self.a_length == self.b_length && self.b_length == self.c_length
        :equilateral
      elsif self.a_length == self.b_length || self.b_length == self.c_length || self.a_length == self.c_length
        :isosceles
      else
        :scalene
      end
    end
    
  end
  class TriangleError < StandardError 
    def message
      "Please input valid triangle values!!!"
    end
  end
  
end
