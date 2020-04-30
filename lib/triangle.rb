class Triangle

  attr_accessor :sides

  def initialize(side1, side2, side3)
    @sides = []
    @sides.push(side1, side2, side3)
  end

  def kind
    if sides.find {|side| side <= 0} || sides.sort.reverse[0] >= sides.sort.reverse[1..-1].sum
      raise TriangleError
    else
      return :equilateral if sides.uniq.length == 1
      return :isosceles if sides.uniq.length == 2
      :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "provided sides does not equate to a valid triangle."
    end
  end
end