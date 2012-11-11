#!/usr/bin/ruby

require 'Box'

# constants
NUMBER_RANGE = 9

class Sudoku
  attr_accessor :box, :row, :col
  
  def initialize
    @box = Box.new(Math.sqrt(NUMBER_RANGE))
    @row = Array.new(NUMBER_RANGE)
    @col = Array.new(NUMBER_RANGE)
  end
  
  def getLengthOfBoard
    NUMBER_RANGE * NUMBER_RANGE
  end
  
end
