#!/usr/bin/ruby

require './Box.rb'

# constants
NUMBER_RANGE = 9

class Sudoku
  attr_accessor :boxes, :rows, :cols, :TOTAL_ITEMS, :BOX_LENGTH
  
  def initialize
    @TOTAL_ITEMS = get_length_of_board
    @BOX_LENGTH = Math.sqrt(NUMBER_RANGE)
    #@box = Box.new(Math.sqrt(NUMBER_RANGE))
    @boxes = Array.new(NUMBER_RANGE)
    for i in 0..(NUMBER_RANGE-1) do
      @boxes[i] = Box.new(Math.sqrt(NUMBER_RANGE))
    end
    @rows = Array.new(@TOTAL_ITEMS)
    @cols = Array.new(@TOTAL_ITEMS)
  end
  
  def get_length_of_board
    NUMBER_RANGE * NUMBER_RANGE
  end
  
  def is_number_valid_in_this_location?(x, y, num)
    # get particular row, col, and box from collections of each
    xRow = @rows[x*NUMBER_RANGE, NUMBER_RANGE]
    yCol = @cols[y*NUMBER_RANGE, NUMBER_RANGE]
    pBox = @boxes[(y/@BOX_LENGTH).floor * @BOX_LENGTH + (x/@BOX_LENGTH).floor]
    
    # check each row, col, and box to make sure that value is legal
    if not xRow.include?(num) and
       not yCol.include?(num) and 
       not pBox.isPresent?(num)
      true
    else
      false
    end
  end
  
end
